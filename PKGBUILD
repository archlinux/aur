# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: M.Carreira <arch@carreira.com.pt>

pkgname=mondo
pkgver=3.2.2
pkgrel=2
pkgdesc="A disaster recovery solution to create backup media that can be used to redeploy the damaged system"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
depends=('mindi>=2.0.7' 'bzip2>=0.9' 'afio' 'cdrkit' 'binutils' 'libnewt>=0.50' 'buffer' 'syslinux>=1.52' 'slang')
makedepends=('libnewt>=0.50' 'gcc' 'autoconf' 'automake' 'libtool')
optdepends=('lzop: File compressor using lzo lib'
  'lzo: A portable lossless data compression library')
source=("ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('41225f2101a70f2f538a66c90bbb4f230f5ac80263b86096c94abb2dd32426a96b84422cdb73c0f91f83404194607c270be81071d8d1b31849a0a2b0784841a6'
            'SKIP')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  sed -i -e 's/kernel26/linux/g' src/mondorestore/mondo-rstr-tools.c
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/var/cache/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  install -m 644 INSTALL COPYING README* TODO AUTHORS NEWS* docs/en/mondorescue-howto.html docs/en/mondorescue-howto.pdf ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}

