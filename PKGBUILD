# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=ogmrip-profiles
pkgver=0.3
pkgrel=3
pkgdesc='Collection of profiles for OGMRip'
arch=('any')
url='http://ogmrip.sourceforge.net/en/profiles.html'
license=('LGPL')
groups=('ogmrip')
depends=('ogmrip>=0.13')
makedepends=(intltool)
source=("http://downloads.sourceforge.net/sourceforge/ogmrip/${pkgname}-${pkgver}.tar.gz"
"http://downloads.sourceforge.net/project/ogmrip/${pkgname}/${pkgver}/README"
locale.patch
)
sha256sums=('77355a69f824e288b81c4beab6f899f826ff025d6627c2d2dcd118dd7352f7dc'
            '9699647eaa8d20963fa410193c809513f21b28077b48c784cec6152cbe9c0898'
            '21094986759433e5c0e5329a6a6ee44edd4e9c93a18b4d7763bdcd0c5f7640c9')
package() {
  cd "$srcdir/$pkgname-$pkgver"

  patch -p1 < ../locale.patch
  ./configure --prefix=/usr --localedir=/usr/share/locale
  make
  make DESTDIR="$pkgdir/" install
  install -Dm0644 README ${pkgdir}/usr/share/ogmrip-profiles/README
}
