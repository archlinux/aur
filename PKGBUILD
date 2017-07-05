# Maintainer : Paula Breton <paula@parashep.com>
# Contributor: robb_force <robb_force@holybuffalo.net>

pkgname=ucon64
pkgver=2.0.3
pkgrel=1
pkgdesc="A ROM backup tool and emulator's Swiss Army knife program."
arch=('i686' 'x86_64')
url="http://ucon64.sourceforge.net/index.php"
license=('GPL')
depends=('zlib')
source=(https://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}-src.tar.gz \
        patch-ucon64_misc.c)
sha256sums=('fdf158a4bc7c3a7d45a60ef495151f635ce39938799d373a29628f5985790bd2'
            'f52d6e0cb307a2c0bc4e4ede0673139f5ddd704199ee12d15f58d2e394f25c80')

prepare() {
  cd ${pkgname}-${pkgver}-src/src

  patch -p0 < ../../patch-ucon64_misc.c
  sed -i 's|$(CFLAGS0)|"$(CFLAGS0)"|g' Makefile
}

build() {
  cd ${pkgname}-${pkgver}-src/src

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}-src/src

  install -Dm775 ucon64 "${pkgdir}"/usr/bin/ucon64
  install -Dm755 libdiscmage/discmage.so "${pkgdir}"/usr/lib/discmage.so
}
