# Contributor: Simon Lundström <simlu@su.se>
# Maintainer: Simon Lundström <simlu@su.se> (or you?)

pkgname=rancid
pkgver=3.11
pkgrel=1
pkgdesc="Really Awesome New Cisco confIg Differ"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.shrubbery.net/rancid/"
license=('BSD')
depends=('expect')
backup=('etc/rancid.conf')
source=( https://shrubbery.net/pub/rancid/${pkgname}-${pkgver}.tar.gz{,.asc} )
md5sums=('1e382f8ebe1c91f6508df56b43727744' '4e7fd29c835c7b7c581be1ddf32fb21e')
sha256sums=('0678a1bad101d48d30308a8df7140eef02698b3a72b5368ff3318bd10394d21a' 'bcbebea9245265f00eb4c0aeb89d68d676e96e470f8d049fc28d8093584737eb')
validpgpkeys=('321D8166DE7230F9241C06ADFC860A57C2B34FCB')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}

  ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --libexecdir=/usr/lib
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install

  # ...
  install -D -m644 "${pkgdir}/usr/share/rancid/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
