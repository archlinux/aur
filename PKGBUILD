# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Helder Correia <helder.correia@netcabo.pt>
# Maintainer: SanskritFritz (gmail)
# Contributor: dreieck (AUR)

pkgname=toppler
pkgver=1.2
pkgrel=1
pkgdesc='A reimplementation of the classic jump & run game "Nebulus"'
arch=('i686' 'x86_64')
url="https://gitlab.com/roever/toppler/"
license=('GPL')
depends=('gcc-libs' 'sdl2_mixer' 'zlib')
makedepends=('gettext' 'gimp' 'imagemagick' 'povray')
optdepends=(
  "${pkgname}-levels: The upstream levels as individual missions that can be played individually, and files that can be loaded into the level editor."
)
source=("https://gitlab.com/roever/toppler/-/archive/v$pkgver/toppler-v$pkgver.tar.gz"
        "$pkgname.desktop")

build() {
  cd "$pkgname-v$pkgver"
  make
}

package() {
  cd "$pkgname-v$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  for _docfile in README.md doc/*; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done
#   install -D -v -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL3.txt"
}
md5sums=('c9a9cd45588bfe721312ed7137b62d47'
         '95f97271fe1f629c396d20bb4d21b924')
