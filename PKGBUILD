# Maintainer: archlinux.info:tdy
# Contributor: quomoow <quomoow@gmail.com>

pkgname=pcmanfm-git
pkgver=r1493.4555839
pkgrel=1
pkgdesc="A fast, lightweight, yet feature-rich file manager with tabbed browsing"
arch=(i686 x86_64)
url=http://pcmanfm.sourceforge.net
license=(GPL)
depends=(libfm-gtk2)
makedepends=(git intltool)
optdepends=('gnome-menus: app menu and "Open with" dialog'
            'lxmenu-data: app menu and "Open with" dialog'
            'gvfs: mount local and remote drives')
provides=(pcmanfm)
conflicts=(pcmanfm)
source=($pkgname::git+git://${pkgname/-/.}.sourceforge.net/gitroot/pcmanfm/pcmanfm)
sha256sums=(SKIP)

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $pkgname
  ./autogen.sh
}

build() {
  cd $pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
}
