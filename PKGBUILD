# Maint4ainer: Brian Biduock <bidulock@openss7.org>
pkgname=novnc
epoch=1
pkgver=0.6.2
pkgrel=1
pkgdesc="javascript vnc client"
arch=(any)
url="https://github.com/kanaka/noVNC"
license=('GPL')
depends=('bash' 'python')
source=("https://github.com/kanaka/noVNC/archive/v${pkgver}.tar.gz")
md5sums=('1528564ce3d1d0a6d047fd9fc56eb421')

prepare() {
  cd $srcdir/noVNC-${pkgver}
  rm -f utils/*.o
  rm -rf .git
}

build() {
  cd $srcdir/noVNC-${pkgver}
# make -C utils clean rebind.so
}

package() {
  cd $srcdir/noVNC-${pkgver}
  mkdir -p $pkgdir/usr/share/novnc $pkgdir/usr/share/doc/novnc $pkgdir/usr/bin
  cp -a include utils images images/favicon.ico vnc.html vnc_auto.html \
	$pkgdir/usr/share/novnc/
  cp -a LICENSE.txt README.md $pkgdir/usr/share/doc/novnc
  cat >$pkgdir/usr/bin/novnc <<EOF
#!/bin/sh

cd /usr/share/novnc || exit 1
exec ./utils/launch.sh \$*
EOF
  chmod 0755 $pkgdir/usr/bin/novnc
}
