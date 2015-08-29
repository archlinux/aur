# Maintainer: M.Carreira <arch@carreira.com.pt>
# Contributor: M.Carreira <arch@carreira.com.pt>
pkgname=mondo
pkgver=3.2.0
pkgrel=3
pkgdesc="A disaster recovery solution to create backup media that can be used to redeploy the damaged system"
arch=('i686' 'x86_64')
url="http://www.mondorescue.org/"
license=('GPL2')
changelog=ChangeLog
depends=('mindi>=2.0.7' 'bzip2>=0.9' 'afio' 'cdrkit' 'binutils' 'libnewt>=0.50' 'buffer' 'syslinux>=1.52' 'slang')
makedepends=('libnewt>=0.50' 'gcc' 'autoconf' 'automake' 'libtool')
optdepends=('lzop: File compressor using lzo lib'
  'lzo: A portable lossless data compression library')
source=('ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz'
         'mondo-initrd.patch')
md5sums=('6f5ef27d940c90a858ce9b1888c23c2d'
	'29ba10f84bd587aa1b80f70f91be6b02')


package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -p1 < ../mondo-initrd.patch
  ./configure --prefix=/usr --sbindir=/usr/bin
  make
  make DESTDIR=${pkgdir} install
  mkdir -p ${pkgdir}/var/cache/${pkgname}
  install -d ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
  install -m 644 INSTALL COPYING README* TODO AUTHORS NEWS* docs/en/mondorescue-howto.html docs/en/mondorescue-howto.pdf ${pkgdir}/usr/share/doc/${pkgname}-${pkgver}
}

# vim:set ts=2 sw=2 et:
