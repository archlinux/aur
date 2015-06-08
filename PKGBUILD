# Contributor: josephgbr <rafael.f.f1@gmail.com>
# Maintainer: GordonGR <ntheo1979@gmail.com>

_pkgname=rtmpdump
pkgname=lib32-${_pkgname}
pkgver=20140918
pkgrel=1
pkgdesc="A tool to download rtmp streams (32 bit)"
arch=('x86_64')
url="http://rtmpdump.mplayerhq.hu/"
license=('GPL2' 'LGPL2.1')
depends=('lib32-openssl' "${_pkgname}")
makedepends=('git')
options=('!makeflags')
source=(git://git.ffmpeg.org/rtmpdump#commit=a1900c3)
md5sums=('SKIP')
options=(!makeflags)

prepare() {
cd ${_pkgname}
sed -i -e 's:gcc:gcc -m32:' Makefile librtmp/Makefile
}

build() {
cd ${_pkgname}
make OPT="$CFLAGS" XLDFLAGS="$LDFLAGS"
}

package() {
cd ${_pkgname}
install -dm755 "${pkgdir}/usr/lib32"
make prefix=/usr mandir=/usr/share/man libdir=/usr/lib32 DESTDIR="${pkgdir}" install
rm -rf "${pkgdir}/usr"/{bin,include,sbin,share}
}
