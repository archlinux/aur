# Maintainer: aksr <aksr at t-com dot me>
pkgname=lsd2dsl-git
pkgver=0.3.0.r1.g95b90ae
pkgrel=1
epoch=
pkgdesc="ABBYY Lingvo dictionaries decompiler, supports the Lingvo x5 and x6 formats."
arch=('i686' 'x86_64')
url="https://github.com/nongeneric/lsd2dsl"
license=('unknown')
groups=()
depends=('libzip' 'boost' 'qt5-base' 'libvorbis' 'libsndfile')
makedepends=('git' 'cmake')
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

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

build() {
  cd "$srcdir/$pkgname"
  cmake . -DCMAKE_RELEASE=TRUE
  make
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 lsd2dsl $pkgdir/usr/bin/lsd2dsl
  install -m755 qtgui/lsd2dsl-qtgui $pkgdir/usr/bin/lsd2dsl-qtgui
  install -Dm644 README.md $pkgdir/usr/share/doc/${pkgname%-*}/README.md
}

