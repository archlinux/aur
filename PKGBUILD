# Maintainer: Sjur Gjøstein Karevoll <sjurberengal at gmail dot com>

pkgname=padd-git
pkgver=v3.0.2.r4.g03cfbd1
pkgrel=1
pkgdesc="PADD - Pi-hole Ad Detection Display"
arch=('any')
url="https://github.com/jpmck/PADD"
license=('unknown')
groups=()
depends=('pi-hole-server' 'netcat')
makedepends=('git')
provides=("padd")
conflicts=("padd")
replaces=()
backup=()
options=()
install=
source=('padd-git::git+https://github.com/jpmck/PADD')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%}"
	git describe --tags | sed 's/-/.r/' | sed 's/-/./g'
}

prepare () {
  cd "$srcdir"/"$pkgname"
  patch -Np2 <<\$$PATCH$$
--- src/padd-git/padd.sh        2019-07-21 11:56:08.616512350 +0200
+++ src.new/padd-git/padd.sh    2019-07-21 11:57:15.376168989 +0200
@@ -109,7 +109,7 @@

 GetFTLData() {
   # Get FTL port number
-  ftl_port=$(cat /var/run/pihole-FTL.port)
+  ftl_port=$(cat /run/pihole-ftl/pihole-FTL.port)

   # Did we find a port for FTL?
   if [[ -n "$ftl_port" ]]; then
$$PATCH$$
}

package() {
  install -Dm755 "$srcdir/${pkgname%}/padd.sh" "$pkgdir/usr/bin/padd"
}
