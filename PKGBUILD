# Maintainer: Reihar <reihar@necronomicon.fr>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: Mike Sampson <mike at sambodata dot com>
# Contributor: Adrian Stratulat <adrian.stratulat at inboxcom>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: KillaB <xGenoBlast@gmail.com>
# Contributor: Callan Barrett <wizzomafizzo@gmail.com>
# Contributor: Christian Schmidt <xmucknertx@googlemail.com>
# Contributor: Sebastian Sareyko <public@nooms.de>

_pkgname=angband
pkgname=angband-ncurses
pkgver=3.5.1
pkgrel=1
pkgdesc="A roguelike dungeon exploration game based on the writings of JRR Tolkien (ncurses-only)"
arch=('i686' 'x86_64')
url="http://rephial.org/"
license=('GPL2' 'custom')
depends=('ncurses')
makedepends=('python-docutils'
			 'texlive-core' #Uncomment if you want a pdf manual. That's quite the dependency, don't you think?
			)
conflicts=('angband' 'angband-git')
source=("http://rephial.org/downloads/${pkgver:0:3}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('3b9a324551cfd48b101f197a8441f135')

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  ./configure \
    --prefix=/usr \
    --bindir=/usr/bin \
    --sysconfdir=/usr/share/angband \
    --with-configpath=/usr/share/angband \
    --with-libpath=/usr/share/angband \
    --disable-x11

  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}"

  make DESTDIR="${pkgdir}" install

  rm -f "${pkgdir}/usr/share/${_pkgname}/*/delete.me"
  install -Dm644 copying.txt "${pkgdir}/usr/share/licenses/${_pkgname}/COPYING"
}
