# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Andreas W. Hauser <andy-aur@splashground.de>
pkgname=cpdup
pkgver=1.18
pkgrel=1
pkgdesc="DragonFly BSD tool to mirror filesystems retaining permissions, flags, ownership, and utimes"
url="http://apollo.backplane.com/FreeBSDPorts/"
license=('BSD')
arch=('i686' 'x86_64')
depends=('libbsd')
makedepends=('pkg-config')
source=(http://apollo.backplane.com/FreeBSDPorts/cpdup-$pkgver.tar.gz
        GNUmakefile)
sha256sums=('2bc7ac20a84ae229a1133e0501b41b0065217dff4da1d2a89948d2c696568526'
            'ff2ce54d0f9d77ee2e49ec18cd88c031a2a650e75422ceb491eed381eeca6a0c')

prepare() {
  cd "$pkgname"
  # HACK I can't use -D since __unused is used as variable name in some system headers
  sed -i 's/__unused/__attribute__((__unused__))/' *.c
}

build() {
  cd "$pkgname"
  make -f "$srcdir"/GNUmakefile
}

package() {
  cd "$pkgname"
  install -Dm 755  cpdup "$pkgdir"/usr/bin/cpdup
  install -Dm 644 cpdup.1  "$pkgdir"/usr/share/man/man1
}
