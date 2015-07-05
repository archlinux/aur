# Maintainer: Raphaël Doursenaud <rdoursenaud@free.fr>

pkgname=frescobaldi-git
pkgver=v2.18.1.r3.g6b4031a
pkgrel=1
pkgdesc="A LilyPond sheet music text editor."
arch=('any')
url="http://www.frescobaldi.org/" 
license=('GPL')
depends=(
  'hyphen'
  'poppler'
  'python>=3.2'
  'python-ly'
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
conflicts=('frescobaldi')
provides=('frescobaldi')
source=("$pkgname"::'git://github.com/wbsoft/frescobaldi.git')
install=frescobaldi-git.install
md5sums=('SKIP')

_gitroot='https://github.com/wbsoft/frescobaldi.git'
_gitname='frescobaldi'

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long | sed -E 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$pkgname"
  # Provided by tango-icon-theme
  rm -rf "frescobaldi_app/icons/Tango"
  # Provided by hyphen-*
  rm -rf "frescobaldi_app/hyphdicts"
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
