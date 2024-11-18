# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>

_pkgauthor=kraanzu
_pkgname=dooit
pkgname=${_pkgname}-bin
pkgver=3.0.4
pkgrel=1
pkgdesc="A todo manager that you didn't ask for, but needed!"
url="https://github.com/${_pkgauthor}/${_pkgname}"
_urlraw="https://raw.githubusercontent.com/${_pkgauthor}/${_pkgname}/v${pkgver}"
arch=('x86_64')
license=('MIT')
depends=('glibc')
makedepends=('tar' 'help2man')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source=("LICENSE-${pkgver}::${_urlraw}/LICENSE"
        "README-${pkgver}::${_urlraw}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/linux-${_pkgname}")
sha256sums=('33504ada23da37774e0d02d99a3a61328f3df017a2bf8468525cd30bb86f57ec'
            'da5260de6a7a79ba5b21425669072d3e83401e3b59e18586dbc53382997ac5df')
sha256sums_x86_64=('5804a6402f4d7b7383813811fe694d60ef4f2d3383b21d10dab3c310fd1b5d9d')

build() {
  cd "${srcdir}/" || exit

  help2man "${_pkgname}" --output "MAN-${pkgver}.1" --no-info
  gzip "MAN-${pkgver}.1"
}

package() {
  cd "$srcdir/" || exit

  install -Dm755 "linux-${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "README-${pkgver}" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 "MAN-${pkgver}.1.gz" "${pkgdir}/usr/share/man/man1/${_pkgname}.1.gz"
}
