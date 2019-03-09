# Maintainer: Justin Benge <justinbng36@gmail.com>
pkgname=ceph-deploy-git
_pkgname=ceph-deploy
pkgver=r2063.e5831d6
pkgrel=1
pkgdesc="Automation tool for ceph file cluster"
arch=("any")
url="https://github.com/ceph/ceph-deploy.git"
license=('MIT')
depends=('python-setuptools' 'python-execnet')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("git+https://github.com/ceph/ceph-deploy.git")
md5sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="$pkgdir" --optimize=1   
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
