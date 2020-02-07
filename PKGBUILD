# Maintainer: aksr <aksr at t-com dot me>
pkgname=lsd2dsl-git
pkgver=0.5.1
pkgrel=1
epoch=
pkgdesc="A decompiler for ABBYY Lingvo’s and Duden proprietary dictionaries."
arch=('i686' 'x86_64')
url='https://github.com/nongeneric/lsd2dsl'
url='https://rcebits.com/lsd2dsl/index.html'
license=('MIT')
groups=()
depends=('libzip' 'boost' 'qt5-base' 'qt5-webkit' 'libvorbis' 'libsndfile')
makedepends=('git' 'cmake>=3.14' 'gtest')
optdepends=()
checkdepends=()
provides=('lsd2dsl')
conflicts=('lsd2dsl')
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/nongeneric/lsd2dsl.git")
noextract=()
md5sums=('SKIP')

prepare() {
  cd "$srcdir/$pkgname"
  sed -i 's/-Werror //' CMakeLists.txt
}

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  cmake . -DCMAKE_RELEASE=TRUE
  make
}

check() {
  cd "$srcdir/$pkgname/tests"
  ./tests
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 console/lsd2dsl $pkgdir/usr/bin/lsd2dsl
  install -m755 gui/lsd2dsl-qtgui $pkgdir/usr/bin/lsd2dsl-qtgui
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
  install -Dm644 LICENSE $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

