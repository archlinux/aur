# Maintainer: Drew S. Ortega <orvyx@protonmail.com>
pkgname=brim
pkgver=0.24.0
pkgrel=1
pkgdesc="Desktop application to efficiently search large packet captures and Zeek logs."
arch=('x86_64')
url="https://www.brimsecurity.com/download/"
license=('custom')
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'glib2')
optdepends=('lsb-release' 'libgnome-keyring' 'pulseaudio')
source=("https://github.com/brimsec/brim/releases/download/v${pkgver}/${pkgname}_amd64.deb"
"https://raw.githubusercontent.com/brimsec/brim/v${pkgver}/LICENSE.txt"
)
noextract=("${pkgname}_amd64.deb")
sha256sums=('f476b174137050f5c730683b2afd048c7daee71a79b792ddcc897accda1b42ea' 'ebc2978c53b0f92bc5e540c07b3d8d864295dd5a448596b2f1131be6ee2edfca')

package() {
	# extract to pkgdir
	bsdtar -O -xf "${pkgname}_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

	# remove debian-specific files
	rm -rf "${pkgdir}/usr/share/lintian"

	# install LICENSE.txt
	install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"	
	install "LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}"
}
