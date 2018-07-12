# Maintainer RetardedOnion@archlinux-irc 
# Original PKGBUILD from notepadqq
## Maintainer: Balló György <ballogyor+arch at gmail dot com>
## Contributor: Doug Newgard <scimmia at archlinux dot info>

pkgname=notepadqq-legacy
pkgver=1.3.6
pkgrel=1
pkgdesc='Notepad++-like text editor for Linux. Legacy version which doesnt ask for restoration at startup.'
arch=('x86_64')
url='https://notepadqq.altervista.org/'
license=('GPL3')
depends=('hicolor-icon-theme' 'qt5-svg' 'qt5-webkit')
provides=('notepadqq')
conflicts=('notepadqq')
makedepends=('git' 'qt5-tools')
options=('!emptydirs')
_commit=2cc6f12a04d51947891d77a5a329a5dd07e28ff7  #1.3.6 commit
source=("git+https://github.com/notepadqq/notepadqq.git#commit=$_commit"
        "git+https://github.com/notepadqq/CodeMirror.git")

pkgver() {
  cd notepadqq
  git describe --tags | sed 's/^v//;s/-/+/g'
}

prepare() {
  cd notepadqq
  git config submodule.src/editor/libs/codemirror.url "$srcdir/CodeMirror"
  git submodule update --init
}

build() {
  cd notepadqq
  qmake-qt5 PREFIX=/usr LRELEASE=/usr/bin/lrelease notepadqq.pro
  make
}

package() {
  cd notepadqq
  make INSTALL_ROOT="$pkgdir" install
}
sha256sums=('SKIP'
            'SKIP')
