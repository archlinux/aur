# Maintainer: aksr <aksr at t-com dot me>
pkgname=hed-git
pkgver=0.5.r486.g44165a6
pkgrel=1
epoch=
pkgdesc="Fast hexadecimal editor"
arch=('i686' 'x86_64')
url="http://repo.or.cz/w/hed.git"
license=('GPL')
groups=()
depends=('')
makedepends=('git')
optdepends=()
checkdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
changelog=
install=echo.install
source=("$pkgname::git://repo.or.cz/hed.git"
        'config.h'
        'libhed_config.h'
        'term.c')
noextract=()
md5sums=('SKIP'
         '4ffceab7d450a05725620726d2221764'
         '6d028b0e51a8db5e4559336e65819729'
         '9b9a96aaf02d2105017fd6346e293ff8')
sha1sums=('SKIP'
          'e5a1eea38f3bc86fa97d76cf0d844d5a22cef0cb'
          'b56277f1e2234933738c7ff753bdb01e13b879ab'
          '961239d4f14a932fd00bc0f923d5ce2daf396ec6')
sha256sums=('SKIP'
            'bc228fce426d79a69d5a6e7ae937e0e9d0d934afaf4ea712bf6a19d00a5deac4'
            '59125dbeb12e94a2c527eb77c2eebaca684c80c4d9e1ffae8f90aff7b4622386'
            '8e1d29f12e8582c55c43e28c85b585e4076a88f78aab37d8f6713b9d64e1206b')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/hed.//'
}

prepare() {
  cd "$srcdir/$pkgname"
  cp ../config.h config.h
  cp ../term.c src/term/term.c
  cp ../libhed_config.h libhed/config.h
}

build() {
  cd "$srcdir/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir/" PREFIX="/usr" install
  install -Dm644 doc/README.dev $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

