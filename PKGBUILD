# Maintainer: Alia_Atreides <mmurphy four zero nine six at gmail dot com>
pkgname=gen1recomp
pkgver=0.2.55
pkgrel=1
pkgdesc="Native LÖVE2D recreation of Pokémon Red/Blue/Yellow (BYO ROM)"
arch=('x86_64')
url="https://github.com/bryanthaboi/gen1recomp"
license=('MIT')
depends=('love>=11.5' 'love<12')
makedepends=('zip' 'unzip' 'git')
source=(
        "git+${url}.git#branch=main"
        "gen1recomp.sh"
        "gen1recomp.png"
        "gen1recomp.desktop")
sha256sums=('SKIP'
'c6be61327aca02c8a3b060a3f678371a6910c685656b15a5b1e8cbf4ffd00bd1'
'8aa282af6887771aec3a69c8003f0e987376bcdaa6c963217575ee4f16d0bba5'
'cd0e5751200361fdde3d6c0aee845d48e9b1cea06a150fe14ac3588bc2c2cd52')

pkgver() {
    cd $srcdir/gen1recomp
    git describe --tags --long --match 'v[0-9]*.[0-9]*.[0-9]*' | sed 's/^v//; s/-.*//'
}

build() {
  cd "$srcdir/gen1recomp"
  ./scripts/pack_love.sh --output "$srcdir/game.love" --listing "$srcdir/love-listing.txt" --version "$pkgver"
}

package() {
  cd "$srcdir/gen1recomp"

  install -Dm644 $srcdir/game.love $pkgdir/usr/share/$pkgname/game.love

  install -Dm755 $srcdir/gen1recomp.sh $pkgdir/usr/bin/$pkgname

  install -Dm644 $srcdir/gen1recomp.png $pkgdir/usr/share/$pkgname/gen1recomp.png

  install -Dm644 $srcdir/gen1recomp.desktop -t $pkgdir/usr/share/applications

  install -Dm644 LICENSE.MD "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
