# Contributor: David Virgilio <drvirgilio@gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi
pkgver=3.1.2
pkgrel=1
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/"
license=('GPL')
depends=(
  'hyphen'
  'poppler'
  'python>=3.3'
  'python-ly>=0.9.5'
  'python-poppler-qt5'
  'python-pyqt5>=5.9'
  'python-pyqtwebengine>=5.9'
  'python-sip'
  'qt5-base>=5.9'
  'qt5-svg>=5.9'
  'qt5-webchannel>=5.9'
  'qt5-webengine>=5.9'
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
  'python-pycups: Printing to a local CUPS server'
)
source=(https://github.com/frescobaldi/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('5c2cffb8282cd9faef1585808bd800d1eb3c0db4cc464a61ce8576dbf7ef9b20')

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
