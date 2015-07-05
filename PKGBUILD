# Contributor: David Virgilio <drvirgilio@gmail.com>
# Contributor: David Zaragoza <david@zaragoza.com.ve>
# Contributor: Clément Démoulins <clement@archivel.fr>
# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi
pkgver=2.18.1
pkgrel=2
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/"
license=('GPL')
depends=(
  'hyphen'
  'poppler'
  'python>=3.2'
  'python-ly>=0.9'
  'python-poppler-qt4'
  'python-pyqt4>=4.8.3'
  'qt4>=4.7'
  'tango-icon-theme'
)
optdepends=(
  'lilypond: Music engraving (recommended)'
# python-portmidi is currently a python2 package
#  'python-portmidi: MIDI playback (default engine)'
  'python-pygame-hg: MIDI playback (alternate engine)'
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
install=$pkgname.install
md5sums=('3cf2aae0d74717d5a7aff089fe46bc8c')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  # Work around a bug in setuptools. Should be fixed soon.
  sed -i '/win/ d' setup.cfg
  # Provided by tango-icon-theme
  rm -rf "frescobaldi_app/icons/Tango"
  # Provided by hyphen-*
  rm -rf "frescobaldi_app/hyphdicts"
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
