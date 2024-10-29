# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=walles
_pkgname=riff
pkgname=${_pkgname}-bin
pkgver=3.3.6
pkgrel=1
pkgdesc='A diff filter highlighting which line parts have changed'
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/${pkgver}"
arch=('x86_64')
license=('MIT')
makedepends=('help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("${url}/releases/download/${pkgver}/${_pkgname}-${pkgver}-x86_64-linux"
        "LICENSE_${pkgver}::${_urlraw}/LICENSE"
        "README_${pkgver}::${_urlraw}/README.md")
sha256sums=('19da0365648b1f973b4f5b79138c1e780b8833af373a13cd2498bffe368db08f'
            '8fe11bd57802035aa8be7cb7382edd1e5f7e53cc6d2ca078271b59b1f94bde26'
            '9d9d78d18ca3aac694d162a2a3f3a719c74f6ba105a33ffc0170c8ad0719a8f6')


build() {
  cd "${srcdir}/" || exit

  mv ${_pkgname}-${pkgver}-x86_64-linux ${_pkgname}
  chmod +x ${_pkgname}

  help2man ${_pkgname} --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "$srcdir/" || exit

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE_${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README_${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1"
}
