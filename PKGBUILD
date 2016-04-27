# Maintainer: Doug Newgard <scimmia at archlinux dot info>

pkgbase=notepadqq-src
pkgname=notepadqq
pkgver=0.51.0
pkgrel=2
pkgdesc='Notepad++-like editor for Linux'
arch=('i686' 'x86_64')
url='http://notepadqq.altervista.org/wp/'
license=('GPL3')
depends=('qt5-webkit' 'qt5-svg')
makedepends=('git' 'qt5-tools')
options=('!emptydirs')
source=("git://github.com/notepadqq/notepadqq.git#tag=v$pkgver"
        'git://github.com/notepadqq/CodeMirror.git')
sha256sums=('SKIP'
            'SKIP')

prepare() {
  cd $pkgname

  git config submodule.src/editor/libs/codemirror.url "$srcdir/CodeMirror"
  git submodule update --init
}

build() {
  cd $pkgname

  qmake-qt5 PREFIX=/usr notepadqq.pro

  make
}

package() {
  cd $pkgname

  make INSTALL_ROOT="$pkgdir" install
}
