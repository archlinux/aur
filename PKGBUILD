# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: xduugu <xduugu@gmx.com>
# Contributor: Elis Hughes <elishughes@googlemail.com>
# Contributor: kaptoxic <kaptoxic@yahoo.com>
# Contributor: Arthur Skowronek <eisensheng@mailbox.org>

pkgname=librtmp0
pkgver=2.4
pkgrel=1
pkgdesc='Toolkit for RTMP streams'
arch=('i686' 'x86_64')
url='http://rtmpdump.mplayerhq.hu/'
license=('GPL2' 'LGPL2.1')
depends=('glibc' 'openssl' 'zlib')
makedepends=('git')
provides=('librtmp.so')
options=('!makeflags')
_commit='c28f1bab7822de97353849e7787b59e50bbb1428'
source=("git://git.ffmpeg.org/rtmpdump#commit=${_commit}")
sha256sums=('SKIP')

build() {
  cd rtmpdump

  make \
    OPT="$CFLAGS" \
    XLDFLAGS="$LDFLAGS"
}

package() {
  cd rtmpdump

  make \
    prefix='/usr' \
    sbindir='/usr/bin' \
    mandir='/usr/share/man' \
    DESTDIR="${pkgdir}" \
    install
  rm -rf "${pkgdir}"/usr/{bin,include,lib/{librtmp.{a,so},pkgconfig},share}
}

# vim: ts=2 sw=2 et:
