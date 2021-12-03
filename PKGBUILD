# Contributor: David Runge <dvzrv@archlinux.org>

_name=jinja2_pluralize
pkgname=python-jinja_pluralize
pkgver=0.3.0
pkgrel=4
pkgdesc="Jinja2 pluralize filters"
arch=(any)
url="https://github.com/audreyr/jinja2_pluralize"
license=(BSD)
depends=(python-inflect python-jinja)
makedepends=(python-setuptools)
checkdepends=(python-pytest)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('8830c01ff82befa353302cadc305147a950038fdf3808632f22dfce9a564a6ba7967781f579a2d94fecb1b5bb01f80d2a53ff082332b94c6e6e3f5f4106e7313')
b2sums=('bb7399d287cf0d1bfed5398c0ad7e6994dfe1d8e942d82190570d0b40d8bec4939d497cb2d9d4415c913f3f3f9c11b017035941755219effa8d92a6ef188dac9')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build:${PYTHONPATH}"
  pytest -v
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 {AUTHORS,CONTRIBUTING,README}.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
