# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=dlume
pkgver=0.2.4
pkgrel=5
pkgdesc="A handy and easy to use addressbook"
arch=('i686' 'x86_64')
url="https://launchpad.net/ubuntu/+source/dlume"
license=('GPL')
depends=('gtk2' 'libxml2' 'desktop-file-utils')
install=$pkgname.install
source=(https://answers.launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${pkgver}.orig.tar.gz
        $pkgname.desktop)
md5sums=('6b2a3ef0eff622a412395187d1c5d178'
         '89d386aa13fe8633379d90c9bb67f523')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install

  install -D -m644 "${srcdir}"/$pkgname.desktop \
    "${pkgdir}"/usr/share/applications/$pkgname.desktop
}
