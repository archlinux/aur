# Maintainer:  Mort Yao <soi@mort.ninja>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dsr <dsr@archlinux.us>

pkgname=aoi
pkgver=3.0.1
pkgrel=1
pkgdesc="A 3D modeling and rendering studio (Art of Illusion)"
arch=('any')
url="http://www.artofillusion.org/"
license=('GPL')
depends=('java-runtime')
optdepends=('jmf:  QuickTime animation support'
            'jogl: OpenGL rendering support')
makedepends=('gendesk')
source=(http://sourceforge.net/projects/aoi/files/ArtOfIllusion/${pkgver}/aoi${pkgver//./}.zip
        aoi.sh)
md5sums=('fbe60582d2c6cc51c84bba47c1e47390'
         'b2c2de959cf1112a729da857bc15111c')

build() {
  cd "$srcdir"
  gendesk -f -n --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --name='AOI (Art of Illusion)' \
    --exec='java -Xmx512m -jar /usr/share/java/aoi/ArtOfIllusion.jar'
}

package() {
  install -dm755 "$pkgdir/usr/share/java"
  cp -r ArtOfIllusion${pkgver//./} "$pkgdir/usr/share/java/aoi"
  install -Dm755 aoi.sh "$pkgdir/usr/bin/aoi"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "ArtOfIllusion${pkgver//./}/Icons/64x64.png" "$pkgdir/usr/share/pixmaps/$pkgname.png"
}
