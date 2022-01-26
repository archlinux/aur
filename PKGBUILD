# Maintainer: David Runge <dvzrv@archlinux.org>

_name=nose-progressive
pkgname=python-nose-progressive
pkgver=1.5.2
pkgrel=9
pkgdesc="Give your tests a progress bar and smarter tracebacks in 3 lines"
arch=('any')
url="https://github.com/erikrose/nose-progressive"
license=('MIT')
depends=('python-blessings' 'python-nose')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('59abe0e5f060149046aa4e9b8ca622af1eb65db3b69631b5c6230c31ee9641f9f7b9bba7ed50709f5243c04a9bbf36fd5901601e3d93e9b68867fc37357b649e')
b2sums=('1d88949369fa29cdb1762455989889f54af2a15efbfc5856bc86936e0a97337a09cd9e82658e467335655835537a42b3507e9cec99f3b1abfadd4f6a88c43e0c')

prepare() {
  mv -v "${_name}-$pkgver" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

check() {
  cd "$pkgname-$pkgver"
  export PYTHONPATH="build/lib:${PYTHONPATH}"
  nosetests noseprogressive || echo "Known failing test: https://github.com/erikrose/nose-progressive/issues/90"
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --optimize=1 --root="${pkgdir}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -vDm 644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
}
