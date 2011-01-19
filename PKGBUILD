# Maintainer: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=synergy
pkgver=1.3.4
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama')
license=('GPL2')
makedepends=('libxt')       # used by configure to test for libx11...
backup=('etc/synergy.conf')
source=("http://synergy-plus.googlecode.com/files/${pkgname}-plus-${pkgver}.tar.gz"
        "${pkgname}s.rc")
md5sums=('2c565afe5f920d363eef38dd97449b73'
         '8f8c01add9bf6e3ae9f37a36ca6345b6')

build() {
  cd "${srcdir}/${pkgname}-plus-${pkgver}"

  ./configure \
	--prefix=/usr \
	--sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-plus-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -d "${pkgdir}/etc/rc.d"
  install -Dm644 examples/${pkgname}.conf "${pkgdir}/etc"
  install -Dm755 $srcdir/${pkgname}s.rc "${pkgdir}/etc/rc.d/${pkgname}s"
}
