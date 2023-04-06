# Maintainer: David Runge <dvzrv@archlinux.org>

_name=publicsuffix
pkgname=python-publicsuffix
pkgver=1.1.1
pkgrel=4
pkgdesc="Get the public suffix of a domain name using the Public Suffix List"
arch=('any')
url="https://publicsuffix.org/"
license=('MIT' 'MPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('eed6be3a4fbc558a6e450eb267883d0125e37e0932db3898a77eb90e3404c40b948b937d082b919dd7d89e8724b6e6eb6427ed79797bd6c006b475391893ea2f')

prepare() {
  mv -v "${_name}-${pkgver}" "$pkgname-$pkgver"
}

build() {
  cd "$pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$pkgname-$pkgver"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}"
  install -vDm 644 {ChangeLog,README.rst} -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -vDm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
