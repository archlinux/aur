# Maintainer: mrxx <mrxx at cyberhome dot at>
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Mark Wagie <mark dot wagie at tutanota dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: jddolvin <jddolvin at atheist dot com>
# Contributor: arriagga <ramon.arriaga at gmail dot com>
# Contributor: dieghen89 <dieghen89 at gmail dot com>

pkgname=musique
pkgver=1.12
pkgrel=1
pkgdesc='A finely crafted music player'
arch=('x86_64')
url='https://flavio.tordini.org/musique'
_giturl='https://github.com/flaviotordini'
license=('GPL3')
depends=('qt6-declarative' 'taglib' 'mpv')
makedepends=('git' 'qt6-tools')
optdepends=('finetune')
source=("git+${_giturl}/musique.git#tag=${pkgver}"
        "git+${_giturl}/http.git"
        "git+${_giturl}/idle.git"
        "git+${_giturl}/media.git"
        "git+${_giturl}/updater.git"
        "git+${_giturl}/js.git"
        "git+${_giturl}/sharedcache.git")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd $pkgname
  git submodule init
  git config submodule.lib/http.url "$srcdir/http"
  git config submodule.lib/idle.url "$srcdir/idle"
  git config submodule.lib/media.url "$srcdir/media"
  git config submodule.lib/updater.url "$srcdir/updater"
  git config submodule.lib/js.url "$srcdir/js"
  git config submodule.lib/sharedcache.url "$srcdir/sharedcache"
  git -c protocol.file.allow=always submodule update
}

build() {
  PATH="$PATH:/usr/lib/qt6/bin"
  qmake6 $pkgname PREFIX=/usr
  make
}

package() {
  make INSTALL_ROOT="$pkgdir" install
}

