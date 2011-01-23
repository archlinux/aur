# Maintainer: Jelle van der Waa <jelle vdwaa nl>
# Contributor: Stéphane Gaudreault <stephane@archlinux.org>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=synergy
pkgver=1.3.6
pkgrel=1
pkgdesc="Share a single mouse and keyboard between multiple computers"
url="http://synergy-foss.org"
arch=('i686' 'x86_64')
depends=('gcc-libs' 'libxtst' 'libxinerama' )
license=('GPL2')
makedepends=('libxt' 'cmake')       # used by configure to test for libx11...
backup=('etc/synergy.conf')
source=("http://synergy.googlecode.com/files/$pkgname-$pkgver-Source.tar.gz" "${pkgname}s.rc" )

build() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

  cmake  -D CMAKE_INSTALL_PREFIX=/usr . 
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}-Source"

#  make DESTDIR="$pkgdir" install # doesn't work atm

  # install binary
  install -d "$pkgdir/usr/bin/"
  install -Dm755 synergyc $pkgdir/usr/bin/
  install -Dm755 synergys $pkgdir/usr/bin/

  # install rc.d script  and config
  install -d "${pkgdir}/etc/rc.d"
  install -Dm644 examples/${pkgname}.conf "${pkgdir}/etc" # true
  install -Dm755 $srcdir/${pkgname}s.rc "${pkgdir}/etc/rc.d/${pkgname}s" # true
}
md5sums=('7a445e97fe01850f60cdf43882d7f385'
         '8f8c01add9bf6e3ae9f37a36ca6345b6')
