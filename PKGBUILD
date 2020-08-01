# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin@atheist.com>
# Contributor: arriagga <ramon.arriaga@gmail.com>
# Contributor: dieghen89 <dieghen89@gmail.com>

pkgname=musique
pkgver=1.9
pkgrel=4
pkgdesc='A finely crafted music player'
arch=('x86_64')
url='https://flavio.tordini.org/musique'
_giturl='https://github.com/flaviotordini'
license=('GPL3')
depends=('qt5-base' 'taglib' 'mpv')
optdepends=('finetune')
makedepends=('git' 'qt5-tools')
source=("git+${_giturl}/musique.git#tag=${pkgver}" "git+${_giturl}/http.git" "git+${_giturl}/idle.git" "git+${_giturl}/media.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.lib/http.url "$srcdir/http"
  git config submodule.lib/idle.url "$srcdir/idle"
  git config submodule.lib/media.url "$srcdir/media"
  git submodule update

  sed -i '1313d;1315i#ifdef APP_EXTRA' src/mainwindow.cpp
}

build() {
  qmake-qt5 $pkgname PREFIX=/usr
  make
}

package() {
  make INSTALL_ROOT="$pkgdir" install
}

