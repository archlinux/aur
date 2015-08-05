# Maintainer: Valsu [arch(at)hylia.de]

pkgname=avanor
pkgver=0.5.8
pkgrel=1
pkgdesc="A feature rich fantasy roguelike game with an easy ADOM-like user interface"
arch=('x86_64' 'i686')
url="http://sourceforge.net/projects/$pkgname/"
license=('GPL2')
depends=('gcc-libs')
source=(http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver-src.tar.bz2
	avanor.desktop
	avanor.png)
md5sums=('20067962b9635b1789933ddd7933d142'
         'c9227bf84747d2de3a40fa8512834c01'
         '2a5466179019b93d48a63a848bd585bd')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  make OPTFLAGS="${CXXFLAGS} -fpermissive" DATA_DIR=/usr/share/avanor/
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  install -D -m755 avanor ${pkgdir}/usr/bin/avanor
  mkdir -p "${pkgdir}"/usr/share/avanor
  cp -rf manual ${pkgdir}/usr/share/avanor/

  install -D -m644 "${srcdir}"/avanor.desktop "${pkgdir}"/usr/share/applications/avanor.desktop
  install -D -m644 "${srcdir}"/avanor.png "${pkgdir}"/usr/share/pixmaps/avanor.png
}
