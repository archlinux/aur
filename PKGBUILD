# $Id$
# Contributor: Jan Alexander Steffens (heftig) <jan.steffens@gmail.com>
# Contributor: Ignacio Galmarino <igalmarino@gmail.com>
# Maintainer: Aaditya Bagga <aaditya_gnulinux@zoho.com>

pkgname=openresolv-openrc
_pkgname=openresolv
pkgver=3.8.1
pkgrel=1
pkgdesc="resolv.conf management framework (resolvconf)"
arch=(any)
url="http://roy.marples.name/projects/openresolv"
license=('custom:BSD')
backup=(etc/resolvconf.conf)
depends=(bash)
provides=(openresolv)
conflicts=(openresolv)
source=("http://roy.marples.name/downloads/openresolv/${_pkgname}-${pkgver}.tar.xz")
sha1sums=('fe4bf41e3ef0323da899cf522e3e5451b3e5c214')
prepare() {
  cd $_pkgname-$pkgver
  sed -n '2,25{s:^# \?::;p}' resolvconf.in >LICENSE 
}

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/lib/resolvconf --sbindir=/usr/bin
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
