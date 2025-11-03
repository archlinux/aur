# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_pkgauthor=keircn
_pkgname=archium
pkgname=${_pkgname}-bin
pkgver=1.9.3
pkgrel=1
pkgdesc="Archium is a wrapper for AUR helpers such as YAY and Paru"
arch=('x86_64')
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
license=('MIT')

provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('glibc' 'readline')

source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
  "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('66a37b615c2d3d566fb792cf78eed43cbc6806a5a7241e7d4b43e475b610443e'
            '3067d2a9287529c972c7ad5c546660eacdaae88040308b0ca3dbfc8a312a88b8')
sha256sums_x86_64=('b8d62807c11a6edd76ed0b5248a2c395e74434a5775fdcf55b89199085505084')

prepare() {
  cd "${srcdir}/" || exit

  mv "release/${_pkgname}" ./
  rm -rf "release"
}

package() {
  cd "${srcdir}/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
