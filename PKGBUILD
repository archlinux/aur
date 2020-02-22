pkgname=xdg-desktop-portal-git
_pkgname=xdg-desktop-portal
pkgver=1.6.0+18+g552a4f3
pkgrel=1
pkgdesc="Desktop integration portals for sandboxed apps"
url="https://github.com/flatpak/xdg-desktop-portal"
arch=(x86_64)
license=(LGPL2.1)
depends=('glib2' 'pipewire' 'fuse2' 'geoclue2')
makedepends=('python' 'xmlto' 'docbook-xsl' 'git' 'flatpak' 'libportal')
checkdepends=('epiphany' 'gedit' 'gvfs')
provides=($_pkgname)
conflicts=($_pkgname)
source=("git+https://github.com/flatpak/xdg-desktop-portal")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure --prefix=/usr --libexecdir=/usr/lib
  make 
}

package() {
  depends+=(xdg-desktop-portal-impl)
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}
