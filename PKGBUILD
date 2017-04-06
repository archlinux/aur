# Maintainer: m4sk1n <m4sk1n vivaldi net>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

pkgname=xfce4-panel-git
pkgver=4.12.1.r205.ga7f3157c
pkgrel=2
pkgdesc="Panel for the Xfce desktop environment - git checkout"
arch=('i686' 'x86_64')
url="http://docs.xfce.org/xfce/xfce4-panel/start"
license=('GPL2')
groups=('xfce4-git')
conflicts=(xfce4-panel)
provides=(xfce4-panel="${pkgver%%.r*}")
depends=('exo>=0.11.0' 'garcon>=0.5.0' 'libxfce4ui>=4.13.0' 'libwnck3' 'hicolor-icon-theme'
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
    --enable-gtk2 \
    --disable-debug
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et: