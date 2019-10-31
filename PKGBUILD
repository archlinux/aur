# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>
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
source=("http://launchpad.net/$pkgname/0.2/$pkgver/+download/$pkgname-$pkgver.tar.gz"
        fix-glib-and-docpath.patch)
sha512sums=('7f7e1b9bd94ff806d98277f2dafbf5b6569efdc6f0367a83e885d38584a8f6e098f31d0f03b080f2ca76394eb73e43f9da07e0d944a2e6443a55d9f2e8fee324'
            '2069f269b5abcd204a00a2e1ced78699e1acf7e7594ff660771911f711e4c3a36931378d32ac97b9fd43216e2522bec2f27e6c8274f2a599999ec8bb6a793f63')

build() {
  cd ${pkgname}-${pkgver}
  patch -p0 < "${srcdir}"/fix-glib-and-docpath.patch
  ./configure --prefix=/usr --disable-static
  make
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}"/ install
}
