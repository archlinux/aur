# Maintainer: Jax Young <jaxvanyang@gmail.com>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Maxwell Pray a.k.a. Synthead <synthead@gmail.com>

_pkgname=python-jenkins
pkgname=python-$_pkgname
pkgver=1.8.2
pkgrel=1
pkgdesc="A python wrapper for the Jenkins REST API which aims to provide a more conventionally pythonic way of controlling a Jenkins server"
url='https://opendev.org/jjb/python-jenkins/'
license=('BSD')
arch=('any')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
depends=(
  'python-six>=1.3.0'
  'python-pbr>=0.8.2'
  'python-multi_key_dict'
  'python-requests'
)
source=("$_pkgname-$pkgver.tar.gz::https://opendev.org/jjb/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('da0da245b7df2a08d1f9d715682abc95d3e5baa514223ad6a39b8e6cd93c9c58b819d01c8a040c989e073bcd2e9815cf6cab5d3999a4a71b24316486b701afc8')

build() {
  cd "$_pkgname"
  python -m build --wheel --no-isolation
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -D COPYING "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
