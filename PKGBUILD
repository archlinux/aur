# Maintainer: aksr <aksr at t-com dot me>
pkgname=fntsample-git
pkgver=5.2.r0.geb3ee08
pkgrel=2
epoch=
pkgdesc="PDF and PostScript font samples generator."
arch=('i686' 'x86_64')
url="https://github.com/eugmes/fntsample"
license=('GPL3')
categories=()
groups=()
depends=('cairo' 'fontconfig' 'freetype2' 'glib2' 'pango')
makedepends=('git' 'cmake')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=
source=("$pkgname::git+https://github.com/eugmes/fntsample"
        "https://unicode.org/Public/UNIDATA/Blocks.txt")
noextract=()
md5sums=('SKIP'
         '9b8efb5bb78698a6cf8b5d12c74f3e4e')
sha1sums=('SKIP'
          '808db9df6d1ba08f152c10d261f87761621e720a')
sha256sums=('SKIP'
            '5ae1649a42ed8ae8cb885af79563f00a9ae17e602405a56ed8aca214da14eea7')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's@([^-]*-g)@r\1@;s@-@.@g;s@^release/@@'
}

build() {
  cd "$srcdir/$pkgname"
  mkdir build || return 0
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DUNICODE_BLOCKS=../../Blocks.txt
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  make DESTDIR="$pkgdir/" install
  install -Dm644 ../README.rst $pkgdir/usr/share/doc/${pkgname%-*}/README.rst
  install -Dm644 ../COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/LICENSE
}

