# Maintainer: Bruno Miguel <bruno@privacyrequired.com>
pkgname=poddr-bin
pkgver=2.0.0
pkgrel=3
pkgdesc="Poddr is an open-source podcast player for Windows, Mac and Linux"
arch=("x86_64")
url="https://github.com/Sn8z/Poddr"
license=("GPL3")
groups=("")
makedepends=("unzip" "sed")
depends=("nodejs" "gtk3" "nss" "libxss" "libxtst" "xdg-utils" "util-linux-libs" "libappindicator-gtk3" "libsecret")
provides=("poddr-${pkgver}")
replaces=("poddr-deb")
conflicts=("poddr")
options=("!strip" "!emptydirs")
source=("https://github.com/Sn8z/Poddr/releases/download/${pkgver}/poddr_${pkgver}_amd64.deb")
sha512sums=('512ede696e4c2f42fe78f1714278d2bce00e3db4163fe948d4bfae3b842ddbbfb81a0f54768b9dffba2e1243edba855f4d9c55248663408de63ede5eedfa56a2')

package(){

	# Extract package data
	tar xf data.tar.xz -C "${pkgdir}"

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 "${pkgdir}/opt/Poddr/chrome-sandbox" || true

	# Install poddr.desktop to the appropriated folder, so any DE can launch it
	install -Dm644 "${pkgdir}/usr/share/applications/poddr.desktop" poddr.desktop

	# TODO
	# find a way to copy the application icons to the correct system folders

	# Update mime and desktop databases
	update-mime-database /usr/share/mime || true
	update-desktop-database /usr/share/applications || true

	# Symlink the binary to /usr/bin
	mkdir $pkgdir/usr/bin
	#cd "${pkgdir}/usr/bin"
    ln -s ../../opt/Poddr/poddr poddr

}
