# Maintainer: Martin Müllenhaupt <mm plus aur dot archlinux dot org at netlair dot de>
# Contributor: Christopher Arndt <aur at chrisarndt dot de>

_pkgname=lupa
pkgname="python2-${_pkgname}"
pkgver=1.9
pkgrel=2
pkgdesc="Python 2 wrapper around LuaJIT"
url="https://github.com/scoder/lupa"
license=('MIT')
arch=('x86_64')
depends=('python2' 'luajit')
makedepends=('cython' 'python2-setuptools')
source=("https://pypi.python.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname}-${pkgver}.tar.gz")
sha256sums=('a3e11d806ca02cf72e490ec1974f8b96a14a1091895c9dccebe0b8d52dd82e8e')


build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py build --with-cython
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1 --skip-build

  install -Dm 644 LICENSE.txt -t "${pkgdir}"/usr/share/licenses/${pkgname}
}
