# Maintainer: 0strodamus <0strodamus at cox dot net>
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor:  <mathieu.clabaut@gmail.com>

pkgname=xdg-user-dirs-nosystemd
_pkgname=xdg-user-dirs
pkgver=0.15
pkgrel=4
pkgdesc="Manage user directories like ~/Desktop and ~/Music"
arch=(i686 x86_64)
url="http://www.freedesktop.org/wiki/Software/xdg-user-dirs"
license=(GPL)
depends=('sh')
makedepends=('docbook-xsl')
provides=('xdg-user-dirs')
conflicts=('xdg-user-dirs')
replaces=('xdg-user-dirs')
backup=(etc/xdg/user-dirs.conf etc/xdg/user-dirs.defaults)
source=(http://user-dirs.freedesktop.org/releases/$_pkgname-$pkgver.tar.gz
        xdg-user-dirs)
sha256sums=('20b4a751f41d0554bce3e0ce5e8d934be98cc62d48f0b90a894c3e1916552786'
            'f0f27de23d849b2fa4ebf59e448b5a843b577d14dc2c1070e228999091fa7f5e')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install 
  install -D ../xdg-user-dirs "$pkgdir/etc/X11/xinit/xinitrc.d/xdg-user-dirs"
}
