# Maintainer: Stefan Seemayer <mail@semicolonsoftware.de>
pkgname=glapse
pkgver=0.3
pkgrel=2
pkgdesc="Take desktop screenshots and glue them to make a time lapse video in GNU/Linux"
arch=(i686 x86_64)
url="https://github.com/dsaltares/glapse"
license=('GPL')
depends=(python2 pygtk scrot ffmpeg)

_GIT_COMMIT='9c52d22dc763b390e6de4660fab85b66c9cd6d1d'

source=(https://github.com/dsaltares/glapse/archive/${_GIT_COMMIT}.zip)
sha256sums=('cf88939b9873df6658eda67795d56dc0879ced89dde7bffb14cbbe8cde79812d')


build() {
  cd "$srcdir/$pkgname-${_GIT_COMMIT}"
  sed -ie "s/install -m/install -Dm/g" makefile
  sed -ie "s/LC_MESSAGES$/LC_MESSAGES\/glapse.mo/g" makefile
  sed -ie "s/avconv/ffmpeg/g" glapseGUI/glapseGUI.py glapseControllers/glapseMain.py
  sed -ie "s/python\b/python2/g" glapse.py glapse
}

package() {
  cd "$srcdir/$pkgname-${_GIT_COMMIT}"

  mkdir -p "$pkgdir/usr/share/locale/{es,en}"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
