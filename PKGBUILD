# Contributor: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=copyq-plugin-itemweb-git
pkgver=r4773.2217511c
pkgrel=1
epoch=1
pkgdesc="Clipboard manager with searchable and editable history. Itemweb plugin."
url="https://github.com/hluk/CopyQ"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('copyq-git' 'qt5-webkit' 'qt5-svg')
makedepends=('git' 'cmake' 'qt5-tools')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=("$pkgname::git+https://github.com/hluk/CopyQ.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_QT5=TRUE $srcdir/$pkgname
  make itemweb
}

package() {
  cd "$srcdir/$pkgname/build"
  install -D -m755 plugins/libitemweb.so $pkgdir/usr/lib/copyq/plugins/libitemweb.so
}

