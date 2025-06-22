# Maintainer: Morgenstern <charles [at] charlesbwise [dot] com>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname=python-pymilter
_commit="20751ea7060741a2ce16e762daae87220f0e8a76"
pkgver="1.0.6.${_commit:0:7}"
pkgrel=1
pkgdesc="Python bindings for libmilter API"
arch=('x86_64')
url="https://github.com/sdgathman/${pkgname##*-}"
license=('GPL-2.0-only')
depends=('python')
makedepends=('libmilter'
             'python-build'
             'python-installer'
             'python-setuptools'
             'python-wheel')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha512sums=('25fd5fe682fd13087d58b71dbd61b2c964a1d3880f514705691ec649ac76789ef291586bc98b6317a3e5ab2585453e8c914b11fc65543ea3ef2e27cbd36f9885')

prepare() {
  cd "${srcdir}"
  mv "${pkgname##*-}-${_commit}" "${pkgname}-${pkgver}"
}

build() {
  cd "${pkgname}-${pkgver}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
