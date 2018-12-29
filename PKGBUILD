# Contributor: David Virgilio <drvirgilio@gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi
pkgver=3.0.0
pkgrel=3
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/"
license=('GPL')
depends=(
  'hyphen'
  'poppler'
  'python>=3.2'
  'python-ly>=0.9.5'
  'python-poppler-qt5'
  'python-pyqt5>=5.4'
  'python-sip'
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
source=(https://github.com/wbsoft/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
md5sums=('dacc4cc23e4de5acef163001d18dfa8c')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # Provided by tango-icon-theme
  rm -rf "frescobaldi_app/icons/Tango"
  # Provided by hyphen-*
  rm -f frescobaldi_app/hyphdicts/hyph_*.dic
  rm -f frescobaldi_app/hyphdicts/README*
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1
}

# vim:set ts=2 sw=2 et:
