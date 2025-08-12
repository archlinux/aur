# Maintainer: Neo Mineden <neoisathing[at]gmail[dot]com>
# Contributor: 

pkgname="galaxy-flasher"
pkgver=alpha.v2025.08.08
pkgrel=0
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
  'python-i18n'
)
makedepends=(
  'git'
)

source=("git+$url.git")
sha256sums=('SKIP')

package() {
	install -Dm 644 "$srcdir/$pkgname/assets/page.codeberg.ethicalhaquer.galaxyflasher.svg" "$pkgdir/usr/share/pixmaps/galaxy-flasher.svg"
 install -d "${pkgdir}/opt"	
	cp -r "$srcdir/$pkgname" "$pkgdir/opt/galaxy-flasher"
	if [ -f "/home/$USER/.config/galaxy-flasher/settings.json" ]; 
	then
	echo -e "\e[32msettings.json already in .config/galaxy-flasher! :3"
	else
	echo -e "\e[33msettings installation commencing >:3"
	install -d 755 "${pkgdir}/home/$USER/.config/galaxy-flasher"
	chmod +x ${pkgdir}/home/$USER/.config/galaxy-flasher
	cat <<EOF > "${pkgdir}/home/$USER/.config/galaxy-flasher/settings.json"
{"odin4_file": "/bin/odin4", "flash_tool": "odin4", "thor_file": "/opt/thor-flash-utility/TheAirBlow.Thor.Shell"}
EOF
	chown -R $USER:$USER ${pkgdir}/home/$USER/.config/galaxy-flasher
	fi
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
	echo -e "\e[31mNOTE: THE CURRENT INSTALLATION IS FOR THIS USER ONLY. \e[35msowwy ):"
}