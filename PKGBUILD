# Maintainer: Archimede Pitagorico <archimede.pitagorico@mail.com>

pkgname=tgcd
pkgver=v1.1.1.0.g4222d3e
pkgrel=1
pkgdesc="tgcd, tcp gender change daemon (reverse tunnel)"
arch=('x86_64')
url='http://tgcd.sourceforge.net/#lbAD'
license=('GPLv2')
source=('git+https://github.com/archimedepitagorico/tgcd.git#tag=v1.1.1'
        )
#install=$pkgname.install

makedepends=('git'
             )
sha1sums=('SKIP'
	)
options=('!buildflags'
        )

pkgver() {
  cd tgcd
  echo "$(git describe --long --tags | tr - . | tr _ .)"
}

prepare() {
  cd tgcd
  ./configure
}

build() {
    cd tgcd
    make
}

package() {
   cd tgcd
   make DESTDIR=${pkgdir} install
   mv ${pkgdir}/usr/local/* ${pkgdir}/usr
   rmdir ${pkgdir}/usr/local
   install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
