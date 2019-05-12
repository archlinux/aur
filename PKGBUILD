# Based on quakespasm PKGBUILD

_pkgname=quakespasm
pkgname=${_pkgname}-spiked-git
pkgver=0.92.1.r332.gd7f84a92
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Quakespasm. AKA QSS. Git version with optional Mission pack desktop files."
arch=('i686' 'x86_64')
url="http://triptohell.info/moodles/qss/"
license=('GPL2')
depends=('libvorbis' 'libmad' 'sdl2')
conflicts=('quakespasm' 'quakespasm-svn')
provides=('quakespasm')
install=$_pkgname.install
source=("${_pkgname}::git+https://github.com/Shpoike/Quakespasm"
        $_pkgname.desktop
        $_pkgname-mp1.desktop
        $_pkgname-mp2.desktop
        $_pkgname-impel.desktop)
sha1sums=('SKIP'
          '7a78889a7a6e24047b4777a8b4827e29cfc87381'
          '2b774f68f889308ba0b8de69580a32ed11f833ec'
          '1184a40775fc46c129828d4a9a35785542c62ee3'
          '2c97f722fc5c9f8d8f1a9a01f55491a448a9253e')

# Using the most recent un-annotated tag reachable from the last commit:
pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname/$_pkgname/Quake/"
  msg "Starting make..."
  make DO_USERDIRS=1 USE_SDL2=1
}

package() {
  cd "$srcdir/$_pkgname/$_pkgname/Quake/"
  install -Dm755 quakespasm "$pkgdir"/usr/bin/$_pkgname
  
  for i in 16 24 32 48 64 72; do
    install -Dm644 $srcdir/$_pkgname/$_pkgname/Misc/QuakeSpasm_512.png $pkgdir/usr/share/icons/hicolor/${i}x${i}/apps/quakespasm.png
  done

  install -Dm644 $srcdir/$_pkgname.desktop $pkgdir/usr/share/applications/$_pkgname.desktop
#
# Uncomment lines depending on the mission pack(s)
# or extension you have.
#
# install -Dm644 $srcdir/$_pkgname-mp1.desktop $pkgdir/usr/share/applications/$_pkgname-mp1.desktop
# install -Dm644 $srcdir/$_pkgname-mp2.desktop $pkgdir/usr/share/applications/$_pkgname-mp2.desktop
# install -Dm644 $srcdir/$_pkgname-impel.desktop $pkgdir/usr/share/applications/$_pkgname-impel.desktop

}


