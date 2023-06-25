# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Thomas Heinemann <thomas@niphba.de>

pkgname=python-mailsuite
_pkgname=${pkgname:7}
pkgver=1.9.15
pkgrel=1
pkgdesc='Python package to make receiving, parsing, and sending email easier'
arch=(any)
url=https://seanthegeek.github.io/mailsuite/
license=(Apache)
depends=(python-dnspython
         python-expiringdict
         python-html2text
         python-imapclient
         python-mail-parser
         python-publicsuffix2)
makedepends=(python-build python-hatchling python-installer)
source=(https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz)
sha512sums=('c495b13f444e3bbaddd4a2f48c6383ac4cef631cafaaf3f9c63d067d25df2af1ca9b60697dd6ed9a1a4fec8758d1b0c8cc83620c3f2617da2e7e4db9b8934da4')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m build --wheel --no-isolation
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 README.md -t "$pkgdir"/usr/share/doc/$pkgname
  install -Dm 644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}
