# Maintainer: Emil Vanherp <emil DOT vanherp AT hot mail DOT com>
# Contributor: Valère Monseur <valere DOT monseur AT ymail·com>

pkgname=eid-viewer
pkgver=4.1.4
pkgrel=1

pkgdesc="Viewer for Belgian Electronic Identity Card"
arch=('i686' 'x86_64')
url="http://eid.belgium.be/"
license=('LGPL3')

depends=('java-runtime' 'gsettings-desktop-schemas' 'eid-mw')
source=("https://dist.eid.belgium.be/continuous/sources/$pkgname-$pkgver-v$pkgver.src.tar.gz")
sha256sums=('64a42f9e2276f3bcb9db0fedebe58a92fca715fba304bff0de7cb0e30b516d1a')
install=eid-viewer.install

# SSL cert expired on July 29th; temporalily use --insecure
DLAGENTS=('https::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 -o %o %u --insecure')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
}

package() {
  cd "$pkgname-$pkgver"
  make install DESTDIR="$pkgdir"
}

# vim:set ts=2 sw=2 et:
