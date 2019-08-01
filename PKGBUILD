# Maintainer:  twa022 <twa022 at gmail dot com>
# Contributor: Peter Lamby <peterlamby@web.de>

pkgname=xfce4-soundmenu-plugin
pkgver=0.7.0+14+g5128501
pkgrel=1
pkgdesc="A very basic xfce4-panel plugin to control any players MPRIS2 compatible."
arch=('i686' 'x86_64')
url="https://github.com/bluesabre/xfce4-soundmenu-plugin"
#url="https://github.com/matiasdelellis/xfce4-soundmenu-plugin"
license=('GPL2')
depends=('xfce4-panel' 'libmpris2client')
makedepends=('intltool' 'git' 'libkeybinder3' 'libnotify' 'libclastfm' 'glyr' 'git')
optdepends=('libclastfm: for Lastfm support'
            'glyr: to search lyrics'
            'libkeybinder3: for global keyboard shortcuts support'
            'libnotify: Notification support')
#source=(https://github.com/matiasdelellis/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2)
_commit='51285017385e4d0f9d52fa5f8e96015ee62f3e2d'
source=("git+https://github.com/bluesabre/xfce4-soundmenu-plugin.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed -r "s/^v//;s/-/+/g"
}


prepare() {
  cd "${pkgname}"
  git submodule update --init
}

build() {
  cd "${pkgname}"
  ./autogen.sh --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib 
  make
}

package() {
  cd "${pkgname}"
  make DESTDIR="${pkgdir}" install
}
