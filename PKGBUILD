pkgname=novnc
pkgver=20130923
pkgrel=1
pkgdesc="javascript vnc client"
arch=(i686 x86_64)
url="http://kanaka.github.com/noVNC/"
license=('GPL')
depends=()
source=("$pkgname::git://github.com/kanaka/noVNC.git")
md5sums=('SKIP')

prepare() {
  cd $srcdir/novnc
  rm -f utils/*.o
  rm -rf .git
}

build() {
  cd $srcdir/novnc
  make -C utils clean rebind.so
}

package() {
  cd $srcdir/novnc
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
