# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Bartek Piotrowski <barthalion@gmail.com>

pkgname=assh
pkgver=2.3
pkgrel=1
pkgdesc="SSH client which uses SSL proxies to establish anonymous connections"
arch=('i686' 'x86_64')
url="http://assh.sourceforge.net/"
license=('GPL')
depends=('openssl')
provides=('corkscrew')
conflicts=('corkscrew')
source=(http://downloads.sourceforge.net/assh/$pkgname-$pkgver.tgz
        destdir.patch)
md5sums=('9ce2dbb55416a9b1c38307b101067275'
         'b90b180edbbaa2237aa0f664ea7a47fd')

build() {
  cd "${srcdir}"/$pkgname

  make
}

package() {
  cd "$srcdir/$pkgname"

  install -d "${pkgdir}"/usr/bin
  patch < "${srcdir}"/destdir.patch

  make DESTDIR="${pkgdir}"  install
}
