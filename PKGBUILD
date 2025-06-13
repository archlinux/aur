# Maintainer: Neo Mineden <neoisathing[at]gmail[dot]com>
# Contributor: 

pkgname="galaxy-flasher"
pkgver=0.6.0
pkgrel=1
pkgdesc="A GUI for Samsung flash-tools"
url="https://codeberg.org/ethical_haquer/galaxy-flasher"
license=("GPL-3.0")
arch=('x86_64')

depends=(
  'gtk4'
  'python3'
  'libadwaita'
  'python-pexpect'
  'odin4-cli'
  'thor-flash-utility'
)
makedepends=(
  'git'
)

source=("git+$url.git")
sha256sums=('SKIP')

package() {
	install -Dm 644 "$srcdir/$pkgname/assets/page.codeberg.ethicalhaquer.galaxyflasher.svg" "$pkgdir/usr/share/pixmaps/galaxy-flasher.svg"
		install -d "${pkgdir}/opt"
	cp -r "$srcdir/$pkgname/source" "$pkgdir/opt/galaxy-flasher"
	install -d "${pkgdir}/usr/share/applications"
	cat <<EOF > "${pkgdir}/usr/share/applications/galaxy-flasher.desktop"
[Desktop Entry]
Name=Galaxy Flasher
Comment=A GUI for Samsung flash-tools
Exec=python3 /opt/galaxy-flasher/galaxy_flasher_gtk.py
Icon=/usr/share/pixmaps/galaxy-flasher.svg
Type=Application
Categories=GNOME;Utility;GTK;
EOF
	install -d 755 "${pkgdir}/home/$USER/.config/galaxy-flasher"
	chmod +x ${pkgdir}/home/$USER/.config/galaxy-flasher
	cat <<EOF > "${pkgdir}/home/$USER/.config/galaxy-flasher/settings.json"
{"odin4_file": "/bin/odin4", "flash_tool": "odin4", "thor_file": "/opt/thor-flash-utility/TheAirBlow.Thor.Shell"}
EOF
}


