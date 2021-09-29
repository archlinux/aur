# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=autokernel
pkgname="python-${_pkgname}"
pkgver=0.9.9
pkgrel=1
pkgdesc="A tool to autodetect and manage kernel configuration options"
arch=('any')
url="https://autokernel.oddlama.org/"
license=('MIT')
depends=('python'
         'python-kconfiglib' 'python-lark-parser' 'python-dateutil'
         'python-requests' 'python-sympy')
makedepends=('python-setuptools' 'python-pbr')
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/$_pkgname/$_pkgname-$pkgver.tar.gz")
sha256sums=('405959337a58f9a9d7e89a5ba211e7e22b16b3c1fac0ba29c3683ba55625cc45')
b2sums=('722615bf3f1222ba610fc8db894018bbb9946b05455adf29f4c86430409370b7e3fd356484a69887dae2c11724141654369cad125b349686b43c1920a0f7975b')

build() {
  cd "${_pkgname}-${pkgver}"

  python setup.py build
}

package() {
  cd "${_pkgname}-${pkgver}"

  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm0644 -t "${pkgdir}/usr/lib"/python*"/site-packages/autokernel/contrib" \
    autokernel/contrib/{config.lark,internal.conf}
  chmod -R +r "$pkgdir/usr/lib"/python*"/site-packages"

  install -Dm0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
