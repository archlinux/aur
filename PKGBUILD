# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: Dan Ziemba <zman0900@gmail.com>

pkgname=lib32-librtmp0
pkgver=2.4
pkgrel=1
pkgdesc='Toolkit for RTMP streams'
arch=('x86_64')
url='http://rtmpdump.mplayerhq.hu/'
license=('GPL2' 'LGPL2.1')
depends=('lib32-glibc' 'lib32-openssl' 'lib32-zlib')
makedepends=('git')
provides=('librtmp.so')
options=('!makeflags')
_commit='c28f1bab7822de97353849e7787b59e50bbb1428'
source=("git://git.ffmpeg.org/rtmpdump#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd rtmpdump

  make \
    OPT="$CFLAGS -m32" \
    XLDFLAGS="$LDFLAGS -m32"
}

package() {
  cd rtmpdump

  make \
    prefix='/usr' \
    sbindir='/usr/bin' \
    libdir='/usr/lib32' \
    mandir='/usr/share/man' \
    DESTDIR="${pkgdir}" \
    install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{librtmp.{a,so},pkgconfig},share}
}

# vim: ts=2 sw=2 et:
