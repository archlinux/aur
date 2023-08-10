# Maintainer: Sauyon Lee <sauyon@setsuna>
pkgname=envision-git
pkgver=r6259.54b0a19
pkgrel=1
epoch=
pkgdesc=""
arch=('i686' 'x86_64')
url=""
license=('BSD-3')
groups=()
depends=(python python2 cmake qt5-svg qt5-webkit lpsolve libgit2 gperftools clang llvm vera++)
makedepends=(qtcreator)
checkdepends=()
optdepends=(gradle)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver::git+https://github.com/dimitar-asenov/Envision"
       "envision.patch")
sha256sums=('SKIP'
            'dbc7f8b72004e4acce27a9719eaefb3bc3bbeedb38793f3f69434cff4b91ad22')
noextract=()

pkgver() {
  cd "$pkgname-$pkgver"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/envision.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p build
  cd build

  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  install -dm755 "$pkgdir/opt/envision"
  cp -r DebugBuild/* "$pkgdir/opt/envision"
  install -dm755 "$pkgdir/usr/bin"
  ln -s "/opt/envision/Envision" "$pkgdir/usr/bin/Envision"
}

# vim:set ts=2 sw=2 et:
