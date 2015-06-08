# Maintainer: Diego <cdprincipe@at@gmail@dot@com>
#Contributor: Gadget3000 <gadget3000 at msn dot com>

_pkgname=thunar-volman
pkgname=thunar-volman-git
pkgver=434.c6164e9
pkgrel=1
pkgdesc="automatic management for removeable devices in thunar"
arch=(i686 x86_64)
license=('GPL2')
url="http://goodies.xfce.org/projects/thunar-plugins/thunar-volman"
groups=('xfce4-goodies-git')
#depends=('thunar-git' 'libxfce4ui' 'hicolor-icon-theme')
depends=('thunar' 'libxfce4ui' 'hicolor-icon-theme')
makedepends=('git' 'intltool' 'pkgconfig' 'xfce4-dev-tools')
conflicts=(thunar-volman)
provides=(thunar-volman)
options=('!libtool')
install=${pkgname}.install
source=('git://git.xfce.org/xfce/thunar-volman')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
#  git describe --always | sed 's|-|.|g'
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir/$_pkgname"
  
  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$srcdir/$_pkgname"
  make DESTDIR="$pkgdir/" install
}
