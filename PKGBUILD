# Maintainer: Bruno Miguel <bruno@privacyrequired.com>
pkgname=poddr-bin
pkgver=2.1.0
pkgrel=1
pkgdesc="Poddr is an open-source podcast player for Windows, Mac and Linux"
arch=("x86_64")
url="https://github.com/Sn8z/Poddr"
license=("GPL3")
makedepends=("unzip" "sed")
depends=("nodejs" "gtk3" "nss" "libxss" "libxtst" "xdg-utils" "util-linux-libs" "libappindicator-gtk3" "libsecret")
provides=("poddr")
options=("!strip" "!emptydirs")
source=("https://github.com/Sn8z/Poddr/releases/download/${pkgver}/poddr_${pkgver}_amd64.deb")
sha512sums=('d96f2b4cd38b9848ad4b8359bcbcfc78847feeae7612e25f50cd7fd7b191c6d05927373e18d05c6d7730461aca8483bde156fdd7a3a12f28feb76d01388fdc90')

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
