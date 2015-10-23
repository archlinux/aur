# Contributor: Erufu / Sébastien Lacroix <erufu.sennin@gmail.com>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>
# Contributor: AddiKT1ve <the.addikt1ve@gmail.com>
# Contributor: Erus <erus.iluvatar@gmail.com>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=wmfs-git
pkgver=r442.3c701a9
pkgrel=1
pkgdesc="A lightweight and highly configurable tiling window manager for X."
arch=('i686' 'x86_64')
url="http://www.wmfs.info/"
license=('BSD')
depends=('libxft' 'imlib2' 'libxinerama' 'libxrandr')
makedepends=('git')
provides=('wmfs')
conflicts=('wmfs' 'wmfs2-git')
source=("$pkgname::git+https://github.com/xorg62/wmfs.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix /usr --xdg-config-dir /etc/xdg --man-prefix /usr/share/man
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
  install -D -m644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

