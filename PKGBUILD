# Maintainer: 3ED <krzysztof1987@gmail.com>

pkgname=gdm-control
_pkgname=openbox
pkgver=3.5.2
pkgrel=1
pkgdesc="a small cli tool which gives you the ability to change the standard behaviour of GDM-2.20 after end of your current session"
arch=('i686' 'x86_64')
url="http://openbox.org"
license=('GPL')
depends=('glib2' 'libxau' 'gdm-old<2.21')
#makedepends=(startup-notification  libxml2  libxinerama  libxrandr  libxcursor  pango  imlib2  librsvg)
source=(http://www.icculus.org/openbox/releases/$_pkgname-$pkgver.tar.gz)
sha256sums=('128fb4ef11f83f6edb1685cfc04f44a16a5322082fc519f9d7cac84fc658af33')

build() {
  cd $_pkgname-$pkgver

  ./configure --prefix=/usr \
    --with-x \
    --enable-startup-notification \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/openbox

  make tools/gdm-control/gdm-control
}

package() {
  cd $_pkgname-$pkgver
  install -dm755 "$pkgdir"/usr/bin/
  install -m755 tools/gdm-control/gdm-control "$pkgdir"/usr/bin/
}
