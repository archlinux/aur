# Maintainer: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Nico <d3sox at protonmail dot com>
pkgname=sysmontask
_gitname=SysMonTask
pkgver=1.3.9
pkgrel=2
pkgdesc="System Monitor With UI Like Windows"
arch=('any')
url="https://github.com/KrispyCamel4u/SysMonTask"
license=('BSD')
depends=('gtk3' 'libwnck3' 'python-cairo' 'python-gobject' 'python-psutil')
makedepends=('python-setuptools')
optdepends=('python-matplotlib: For Log Plot utility')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        "$pkgname.patch")
sha256sums=('efb6934148333aee25560f830d43aa596f19a1145db5503eeaeb82c873013897'
            'e2286b2c3d59fa8de51ce0b07b58308c560b49c5c7f1967a93c6d6c764a0a93e')

prepare() {
  cd "$_gitname-$pkgver"
  patch -Np1 -i "$srcdir/$pkgname.patch"

  # Fix version in About dialog:
  sed -i "s/1.3.7/${pkgver}/g" "glade_files/$pkgname.glade"
}

build() {
  cd "$_gitname-$pkgver"
  python setup.py build
}

package() {
  cd "$_gitname-$pkgver"
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
