# Maintainer: m4sk1n <m4sk1n vivaldi net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-git
pkgver=4.12.1.r139.g80687bd6
pkgrel=1
pkgdesc="Panel for the Xfce desktop environment - git checkout"
arch=('i686' 'x86_64')
url="http://docs.xfce.org/xfce/xfce4-panel/start"
license=('GPL2')
groups=('xfce4-git')
conflicts=(xfce4-panel)
provides=(xfce4-panel="${pkgver%%.r*}")
depends=('cairo>=1.0.0' 'exo>=0.11.0' 'garcon>=0.5.0' 'libxfce4ui>=4.13.0' 'libxfce4util>=4.9.0' 'libwnck>=3.0' 'hicolor-icon-theme'
         'desktop-file-utils')
makedepends=('intltool' 'gtk-doc>=1.9' 'git')
source=("$pkgname::git://git.xfce.org/xfce/xfce4-panel")
sha256sums=('SKIP')

build() {
  cd "$pkgname"

  ./autogen.sh \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --enable-gio-unix \
    --enable-gtk-doc \
    --enable-gtk3 \
    --disable-debug
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et: