# Maintainer: Jens Adam <jra@byte.cx>

pkgname=bastet
pkgver=0.43.1
pkgrel=2
pkgdesc="Tetris(r) clone with 'bastard' block-choosing AI"
url="http://fph.altervista.org/prog/bastet.html"
license=('GPL3')
arch=('i686' 'x86_64')
depends=('boost-libs' 'ncurses')
makedepends=('boost')
backup=('var/games/bastet.scores2')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/fph/bastet/archive/${pkgver}.tar.gz")
md5sums=('a76fb6b4bd49f780a52153d199fec98c')

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}
  make
}

package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  # populate files
  install -D bastet "${pkgdir}"/usr/bin/bastet
  install -Dm644 bastet.6 "${pkgdir}"/usr/share/man/man6/bastet.6
  install -Dm644 bastet.desktop "${pkgdir}"/usr/share/applications/bastet.desktop
  install -Dm644 bastet.appdata.xml "${pkgdir}"/usr/share/appdata/bastet.appdata.xml
  for F in AUTHORS INSTALL NEWS README; do
    install -Dm644 ${F} "${pkgdir}"/usr/share/doc/bastet/${F}
  done

  # prepare the (optional) global highscore file
  # (users need to be in 'games' group, obviously)
  install -dm775 -g games "${pkgdir}"/var/games
  touch "${pkgdir}"/var/games/bastet.scores2
  chmod 664 "${pkgdir}"/var/games/bastet.scores2
  chown root:games "${pkgdir}"/var/games/bastet.scores2
}
