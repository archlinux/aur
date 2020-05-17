# Maintainer: Frederik Schwan <freswa at archlinux dot org>
# Contributor: Felix Yan <felixonmars@gmail.com>
# Contributor: kiefer <jorgelmadrid@gmail.com>
# Contributor: Alessio Sergi <asergi at archlinux dot us>
# Contributor: Gaute Hope <eg@gaute.vetsj.com>
# Contributor: Marcos Heredia <chelqo@gmail.com>

pkgname=gtkhotkey
pkgver=0.2.1
pkgrel=9
pkgdesc="Platform independent hotkey handling for Gtk+ applications"
arch=('i686' 'x86_64')
url="https://launchpad.net/gtkhotkey"
license=('LGPL3')
depends=('gtk2')
makedepends=('intltool')
source=("https://launchpad.net/$pkgname/0.2/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        fix-glib-and-docpath.patch)
b2sums=('05ed162cc1eec7e6c981e796a5dca125e5c940c38ed79d67699d7194fce0c77489f3aae9747ae8610c14417b9871859cb5024990f6adb3524e6e14265603a07b'
        'aebde310cf6fdafbf0e3754c1d895481187a21441720601e7bd15a68a7fdc43cbf3043f922d84f73e85374011f72d7216745973f2289aa4e71f00695d8bddf89')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0 < "${srcdir}"/fix-glib-and-docpath.patch
}

build() {
  cd ${pkgname}-${pkgver}
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}"/ install
}
