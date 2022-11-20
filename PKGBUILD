# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=python38-hacking
pkgver=5.0.0
pkgrel=1
arch=('any')
pkgdesc='OpenStack Hacking Guideline Enforcement'
url='https://docs.openstack.org/developer/hacking'
license=('Apache')
depends=('flake8')
makedepends=('python38-pbr' 'python38-setuptools')
checkdepends=('python38-ddt' 'python38-oslotest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/openstack/hacking/archive/$pkgver.tar.gz")
sha512sums=('d698a2643d26e867b0eda47f4bd1c80be878a0ba2ef74595a38237ff3c49112bca541956b751291b6f691234eacf26c58dea151aaf40ab10cc70446a93f85fc6')

export PBR_VERSION=$pkgver

prepare() {
  cd hacking-$pkgver
  sed -i 's/~=/>=/' requirements.txt
}

build() {
  cd hacking-$pkgver
  python3.8 setup.py build
}

check() {
  cd hacking-$pkgver
  # Our flake8 is too new
  stestr run || echo "Tests failed"
}

package_python38-hacking() {
  cd hacking-$pkgver
  python3.8 setup.py install --root "$pkgdir" --optimize=1
}
