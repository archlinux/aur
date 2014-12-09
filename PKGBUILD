# Maintainer: Frederik "Freso" S. Olesen <freso.dk@gmail.com>
_pkgname=stultitiasimplex
pkgname=${_pkgname}-bin
pkgver=1.3.1
pkgrel=1
pkgdesc='Simple soundboard application.'
arch=('i686' 'x86_64')
url='http://stultitiasimple.sourceforge.net/'
# It has actually moved to GitHub, but doesn't seem to have been set up with GH
# pages: https://github.com/ruedigergad/stultitiasimplex
license=('GPL3')
depends=('libsndfile' 'portaudio' 'pulseaudio' 'qt4')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-git")
source=("https://downloads.sourceforge.net/project/stultitiasimple/releases/$pkgver/${_pkgname}_linux.tar.gz"
        "${_pkgname}.desktop")
md5sums=('be6e5dbc3aa21b8a63e210264a9f9bb4'
         'ac1e278bd2c6f6fb384ea29fe9cb8dc4')

if [[ $CARCH == 'x86_64' ]]; then
  depends=('lib32-libsndfile' 'lib32-portaudio' 'lib32-libpulse' 'lib32-qt4')
fi

package() {
  cd "$srcdir/$_pkgname"
  install -Dm755 'StultitiaSimplex' "$pkgdir/usr/bin/StultitiaSimplex"
  install -Dm644 'README.txt' "$pkgdir/usr/share/doc/$_pkgname/README.txt"
  install -Dm644 'Changelog.txt' "$pkgdir/usr/share/doc/$_pkgname/Changelog.txt"
  install -Dm644 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}

