# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Contributor: M.Carreira <arch@carreira.com.pt>

pkgname=mondo
pkgver=3.3.0
pkgrel=1
pkgdesc="A disaster recovery solution to create backup media that can be used to redeploy the damaged system"
arch=('any')
url="http://www.mondorescue.org/"
license=('GPL2')
depends=('mindi>=2.0.7' 'bzip2>=0.9' 'afio' 'cdrkit' 'binutils' 'libnewt>=0.50' 'buffer' 'syslinux>=1.52' 'slang')
makedepends=('libnewt>=0.50' 'gcc' 'autoconf' 'automake' 'libtool')
optdepends=('lzop: File compressor using lzo lib'
  'lzo: A portable lossless data compression library')
source=("ftp://ftp.mondorescue.org/src/${pkgname}-${pkgver}.tar.gz"
	"${pkgname}-${pkgver}.tar.gz.sig")
sha512sums=('228bca88abed2cae80df2e2e2765f4d4cb17529fbaed2beb53a9f9376444e77e391dc14bf0cff9d10663061742970fd9498a2b17ba4e0e63a6fcc2b2c34abfa5'
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

