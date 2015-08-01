# $Id$
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=lxpanel-gtk3
_pkgname=lxpanel
pkgver=0.8.1
pkgrel=2
pkgdesc='Lightweight X11 desktop panel for LXDE (GTK+ 3 version)'
arch=('i686' 'x86_64')
license=('GPL2')
url='http://lxde.org/'
groups=('lxde-gtk3')
depends=('gtk3' 'alsa-lib' 'menu-cache' 'lxmenu-data' 'libwnck3' 'libfm-gtk3' 'libkeybinder3')
makedepends=('intltool' 'docbook-xml' 'docbook-xsl' 'wireless_tools')
optdepends=('wireless_tools: netstat plugin')
conflicts=($_pkgname)
source=(http://downloads.sourceforge.net/lxde/$_pkgname-$pkgver.tar.xz
        lxpanel-0.8.0-gtk3.patch
        gtk3.patch)
sha256sums=('c657eb049a0f59e7b2d1ad6cb621c272833b765705c19089e48b3c248351b1e0'
            '2397d98806df273f32d35d66fcc532fdf08bec783e727b0ecfb30b7fcb9851df'
            'a8779eac8b7342e96bcdd2208bd440b23328ffa7bd46db58d7b2cb9a3fd2ccbb')

prepare() {
  cd $_pkgname-$pkgver

  # Port to GTK+ 3
  patch -Np1 -i ../lxpanel-0.8.0-gtk3.patch
  patch -Np1 -i ../gtk3.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure \
    --sysconfdir=/etc \
    --prefix=/usr \
    --enable-gtk3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
