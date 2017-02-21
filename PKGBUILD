# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi-git
pkgver=3.0.0.r1.g67e87431
pkgrel=2
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/"
license=('GPL')
makedepends=('git')
depends=(
  'hyphen'
  'poppler'
  'python>=3.2'
  'python-ly>=0.9.5'
  'python-poppler-qt5'
  'python-pyqt5>=5.4'
  'qt5-base>=5.4'
  'qt5-svg>=5.4'
  'qt5-webkit>=5.4'
  'hicolor-icon-theme'
  'tango-icon-theme'
)
optdepends=(
  'lilypond: Music engraving (recommended)'
# python-portmidi is currently a python2 package
#  'python-portmidi: MIDI playback (default engine)'
  'python-pygame: MIDI playback (alternate engine)'
  'portmidi: MIDI playback (fallback engine)'
  'hyphen-de: German hyphenation rules'
  'hyphen-en: English hyphenation rules'
  'hyphen-es: Spanish hyphenation rules'
  'hyphen-fr: French hyphenation rules'
  'hyphen-hu: Hungarian hyphenation rules'
  'hyphen-it: Italian hyphenation rules'
  'hyphen-nl: Dutch hyphenation rules'
  'hyphen-ro: Romanian hyphenation rules'
)
provides=("${pkgname%-git}=$pkgver-$pkgrel")
conflicts=("${pkgname%-git}")
source=("${pkgname}"::'git://github.com/wbsoft/frescobaldi.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  # Provided by tango-icon-theme
  rm -rf "frescobaldi_app/icons/Tango"
  # Provided by hyphen-*
  rm -f frescobaldi_app/hyphdicts/hyph_*.dic
  rm -f frescobaldi_app/hyphdicts/README*
}

package() {
  cd "${srcdir}/${pkgname}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
