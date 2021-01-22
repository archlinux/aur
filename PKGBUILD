# Maintainer: Tim Yang <protonmail = timdyang>
# Contributor: quomoow <quomoow@gmail.com>

pkgname=pcmanfm-git
pkgver=r1660.be8c60d
pkgrel=1
pkgdesc="Extremely fast and lightweight file manager"
arch=(i686 x86_64)
url=https://lxde.org/
license=(GPL)
depends=(libfm-gtk2 lxmenu-data)
makedepends=(git intltool)
optdepends=('gvfs: mount local and remote drives'
            'xarchiver: manage archives')
provides=(${pkgname%-*})
conflicts=(${pkgname%-*})
source=($pkgname::git+https://github.com/lxde/${pkgname%-*}.git)
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
