# Contributor: Simon Lundström <simlu@su.se>
# Maintainer: Simon Lundström <simlu@su.se> (or you?)

pkgname=rancid
pkgver=3.14
pkgrel=1
pkgdesc="Really Awesome New Cisco confIg Differ"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.shrubbery.net/rancid/"
license=('BSD')
depends=('expect')
backup=('etc/rancid.conf')
source=( https://shrubbery.net/pub/rancid/${pkgname}-${pkgver}.tar.gz{,.asc} )
md5sums=('b778d0d106867bac406eace8d0e0acb7'  '96d26e9a3536efec7074f54300a36bb2')
sha256sums=('cbf608d8508b55dffb6b30c7a1c45c16ea53af7611a466e0cc47a863252f6e49' '203fdb59477c40ee9f1b4bd757200584fc514109ebf3b7953c651436e0bb248d')
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
