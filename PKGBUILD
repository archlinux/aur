#  Maintainer: Loui Chang <base64:bG91aXBjLmlzdEBnbWFpbC5jb20=>
# Contributor: Jeff Mickey <j@codemac.net>

pkgname=libvc
pkgver=003
pkgrel=3
pkgdesc="vCard library."
arch=('i686' 'x86_64')
url="http://rolo.sourceforge.net"
license=("LGPL")
depends=('glibc')

source=(
    http://downloads.sourceforge.net/rolo/$pkgname-$pkgver.tar.gz
    count-vcards-buffer-overflow.diff
    field-names-comply-with-vCard2.1diff
    manpage-Lb-definition.diff
    accept-line-folding.diff
)

# Patches originate from
# https://anonscm.debian.org/cgit/users/rafael/deb-pkg/libvc.git/
# but I don't want to rely on the source being available.

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  patch -p1 -i ../count-vcards-buffer-overflow.diff
  patch -p1 -i ../field-names-comply-with-vCard2.1diff
  patch -p1 -i ../manpage-Lb-definition.diff
  patch -p1 -i ../accept-line-folding.diff

  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
  find ${pkgdir} -name '*.la' -exec rm {} \;
}

md5sums=(
    '3c9f0fb512d02d179f57a9eadcfa1043'
    '98b3c99555f1e69a0d07152cb800da4f'
    'd5bd5ff0720cc726998694c2e01e495e'
    '1366acdbc5569cd18079d823eb91782c'
    '8cf005aac291836e574751f49b5fa32b'
)

sha256sums=(
    'c5e75ff0ad63b723179dfcc62849adedcfa575473b784f3bca982b2c481e0b9b'
    '78466514046a2c04e3c50b51d4a8e1d7c0f4ae781b0d1221078b9e9ba46dbab2'
    'bfeb6c52aece423646454ca17905fdf2c351eb56fa19a79db51c4c0c08420c5e'
    '08798202bcc7c8453eeb13f5328ec1a135527f55920b67d05ec1674692191691'
    '62e8ab67b03d4140ced02ec894a460bf3a0d06f86f1d4ab804132d71cc8b0e7d'
)
