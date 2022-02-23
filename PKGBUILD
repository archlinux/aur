# Maintainer: Piotr Gorski <lucjan.lucjanov@gmail.com>
# Contributor: epitron <chris@ill-logic.com>

pkgname=gitless
pkgver=0.9.14
pkgrel=1
pkgdesc="A scientifically proven easier-to-use git interface"
arch=("any")
url="https://github.com/goldstar611/gitless"
license=("MIT")
depends=('python' 'git' 'python-pygit2>=1.4.0' 'python-setuptools' 'python-argcomplete')
source=("https://github.com/goldstar611/gitless/archive/$pkgver.tar.gz")
sha256sums=('dbd2b63e18b1d12de757d22117bca21b1b5830fe241682cb35018378a6636dd4')

prepare() {
  cd $pkgname-$pkgver
  
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    echo "Applying patch $src..."
    patch -Np1 < "../$src"
  done
}

build() {
  cd $pkgname-$pkgver
  python setup.py build
}

package() {
  cd $pkgname-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 --skip-build
}
