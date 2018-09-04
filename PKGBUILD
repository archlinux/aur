# Contributor: Simon Lundström <simlu@su.se>
# Maintainer: Simon Lundström <simlu@su.se> (or you?)

pkgname=rancid
pkgver=3.8
pkgrel=1
pkgdesc="Really Awesome New Cisco confIg Differ"
arch=('i686' 'x86_64' 'armv7h')
url="http://www.shrubbery.net/rancid/"
license=('BSD')
depends=('expect')
backup=('etc/rancid.conf')
source=( ftp://ftp.shrubbery.net/pub/rancid/${pkgname}-${pkgver}.tar.gz )
md5sums=('5d05c257f984fb987e3a56f0402a66e7')
sha256sums=('cecdeed2379c832fb5988f4dc8c45fbbbb382723882a9ffea577e54f5ab8cc5f')

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
