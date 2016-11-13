# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: sandman <r.coded@gmail.com>
# Contributor: Christoph Siegenthaler <csi@gmx.ch>

pkgname=xprobe2
pkgver=0.3
pkgrel=3
pkgdesc='Active OS fingerprinting tool'
arch=('i686' 'x86_64')
license=('GPL2')
url='https://sourceforge.net/projects/xprobe/'
backup=('etc/xprobe2/xprobe2.conf')
depends=('libpcap')
source=("http://downloads.sourceforge.net/project/xprobe/xprobe2/Xprobe2 ${pkgver}/${pkgname}-${pkgver}.tar.gz"
        fix-for-gcc4.3.patch
        reproducible_build.patch)
sha512sums=('fd499ada22be5df3e01630948cb72d1a9e648e0c7bfaf2a688386a61c67bb36a326a9e2f3f2b9960a6a49128343010aafe8a3f04ec05e89420a1384215e41f21'
            '50fe71183e9717af0fcce97ecc2971b5be7024f07cb7acb5d019bf07d6549382936c8c6db860d18639e555263907654e1852054670cb3df5b618d62a1f47858b'
            '1ade43894b078521f16bf7609af551455211eb1b2e4c571bf23639abb530391f2474ad49f3a2f52c0298344691faa0e18250909d04b30156d5e2732df29399c5')

prepare(){
  cd ${pkgname}-${pkgver}
  patch -p1 < "${srcdir}/fix-for-gcc4.3.patch"
  patch -p1 < "${srcdir}/reproducible_build.patch"
}

build(){
  cd ${pkgname}-${pkgver}
  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --sysconfdir=/etc
  make
}

package(){
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
