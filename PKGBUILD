# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: dale <dale@archlinux.org>
# Contributor: Tom Newsom <Jeepster@gmx.co.uk>
# Contributor: Helder Correia <helder.correia@netcabo.pt>
# Maintainer: SanskritFritz (gmail)
# Contributor: dreieck (AUR)

pkgname=toppler
pkgver=1.2
pkgrel=2
pkgdesc='A reimplementation of the classic jump & run game "Nebulus"'
arch=('i686' 'x86_64')
url="https://gitlab.com/roever/toppler/"
license=('GPL3')
depends=('gcc-libs' 'sdl2_mixer' 'zlib')
makedepends=('gettext' 'gimp' 'imagemagick' 'povray')
optdepends=(
  "${pkgname}-levels: The upstream levels as individual missions that can be played individually, and files that can be loaded into the level editor."
)
source=(
  "https://gitlab.com/roever/toppler/-/archive/v$pkgver/toppler-v$pkgver.tar.gz"
  "$pkgname.desktop"
  "$pkgname.png"
  )
sha256sums=(
  '36baba81b7a47547b489e9a5da9b086833b13fee132fd9ebdb67bfcd82ce92ca'
  '828b4f8f6901e757de8cce76473caa1064b2db1375330eee370b0eff79909e9a'
  'fff858bedef2a563cecf3379326d8fa6d7e2a18351cbbaac02ca0ae8176adedd'
)

build() {
  cd "$pkgname-v$pkgver"
  make
}

package() {
  cd "$pkgname-v$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
  for _docfile in README.md doc/*; do
    install -D -v -m644 "${_docfile}" "${pkgdir}/usr/share/doc/${pkgname}/${_docfile}"
  done
#   install -D -v -m644 'COPYING' "${pkgdir}/usr/share/licenses/${pkgname}/COPYING.GPL3.txt"
}
