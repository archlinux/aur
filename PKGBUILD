# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

pkgname=rtmpsnoop-git
pkgver=0
pkgrel=1
pkgdesc='rtmpSnoop lets you to grab the RTMP properties from live or dumped video streams'
arch=('any')
url='https://github.com/andreafabrizi/rtmpSnoop'
license=('LGPL')
depends=('python2>=2.7' 'scapy')
makedepends=('git')
provides=('rtmpsnoop')
conflicts=('rtmpsnoop')
source=('rtmpSnoop::git://github.com/andreafabrizi/rtmpSnoop.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/rtmpSnoop"
  git describe --always | sed 's|-|.|g'
}

package() {
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/share/rtmpsnoop"
  cp -r "$srcdir/rtmpSnoop/lib" "$srcdir/rtmpSnoop/rtmpSnoop.py" "$pkgdir/usr/share/rtmpsnoop/"
  cat>"$pkgdir/usr/bin/rtmpsnoop"<<EOF
#!/bin/bash
exec python2 /usr/share/rtmpsnoop/rtmpSnoop.py "\$@"
EOF
  chmod 755 "$pkgdir/usr/bin/rtmpsnoop"
}
