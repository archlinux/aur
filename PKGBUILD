# Maintainer: Milk Brewster <milk on freenode>
_pkgname="fmedia"
pkgname="${_pkgname}-git"
pkgver=android.v0.8.r0.12cd09b
pkgrel=1
pkgdesc="fast media player/recorder/converter"
arch=("x86_64")
url="https://github.com/stsaz/fmedia"
license=('unknown')
groups=()
depends=('sqlite')
makedepends=('git' 'svn' 'flac' 'mpg123' 'libpulse' 'unzip' 'jdk8-openjdk' 'dos2unix' 'cmake' 'gtk3')
provides=("${pkgname}" "fmedia")
conflicts=("${pkgname}" "fmedia")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/stsaz/ffbase'
        'git+https://github.com/stsaz/ffaudio'
        'git+https://github.com/stsaz/ffos'
        'git+https://github.com/stsaz/avpack'
        'git+https://github.com/stsaz/fmedia'
)
noextract=()
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"

  # Git, tags available
  printf "%s" "$(git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}


build() {
  cd "$srcdir/fmedia/alib3"
  make
  make md5check
  make install
  cd ../../

  cd fmedia
  make
  make install

}

check() {
  cd "$srcdir/${_pkgname}"
  # make -k check
}

package() {
  # cd "$srcdir/${_pkgname}"
  cd "$pkgdir"
  install -Dm755 "$srcdir/fmedia/fmedia-1/fmedia" "$pkgdir/opt/fmedia/fmedia"
  cp -r $srcdir/fmedia/fmedia-1/* $pkgdir/opt/fmedia/
  mkdir -p "$pkgdir/usr/bin/"
  ln -s "$pkgfir/opt/fmedia/fmedia" "$pkgdir/usr/bin/fmedia"
  rm -rf /tmp/ff3pt-build
}
