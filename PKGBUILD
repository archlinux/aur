# Maintainer: kleintux <reg-archlinux AT klein DOT tuxli DOT ch> 

pkgname=sencrypt
pkgver=4
pkgrel=2
pkgdesc='sencrypt and sdecrypt are utilities for encrypting and decrypting data with the AES, DES, 3DES, and RC4 algorithms.'
url="https://code.guido-berhoerster.org/projects/sencrypt/"
license=('CUSTOM')
makedepends=('libxslt')
arch=('x86_64' 'aarch64')
source=("https://code.guido-berhoerster.org/projects/sencrypt/downloads/sencrypt-${pkgver}.tar.gz"
        "LICENSE")
sha256sums=('3f2f9111a5a581b31d9ad85acefe692640dbdc1cd34816b8a115fbbe5ef4d3fe'
            '210f092f7130713caf1cfa58be14418c569164063b5cbebaa0ddac6b7034be5a')

build() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	make
  gzip sencrypt.1
}

package() {
	cd ${srcdir}"/"${pkgname}"-"${pkgver}
	install -Dm644 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -Dm644 "${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
  ln -s "/usr/share/man/man1/${pkgname}.1.gz" "${pkgdir}/usr/share/man/man1/sdecrypt.1.gz"
	install -Dm644 "${startdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
