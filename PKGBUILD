# Maintainer: aksr <aksr at t-com dot me>
pkgname=kirss-git
pkgver=0.8.r9.gb4328ad
pkgrel=2
epoch=
pkgdesc="A simple RSS reader."
arch=('any')
url="https://github.com/nathanj/kirss"
license=('BSD')
groups=()
depends=('python>=2.5')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=('kirss')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/nathanj/kirss")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's#man/#share/&#; 15 s/\.py//' setup.py
}

build() {
  cd "$srcdir/$pkgname"
  ln -sf kirss.py kirss
  python2 setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python2 setup.py install --prefix=/usr --root="$pkgdir"
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

