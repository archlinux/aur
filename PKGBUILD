# Maintainer:  Mort Yao <soi@mort.ninja>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dsr <dsr@archlinux.us>

pkgname=aoi
pkgver=3.0.3
pkgrel=1
pkgdesc="A 3D modeling and rendering studio (Art of Illusion)"
arch=('any')
url="http://www.artofillusion.org/"
license=('GPL')
depends=('java-environment')
optdepends=('jmf:  QuickTime animation support'
            'jogl: OpenGL rendering support')
makedepends=('gendesk')
source=(http://sourceforge.net/projects/aoi/files/ArtOfIllusion/${pkgver}/ArtOfIllusion${pkgver//./}-Linux.zip
        aoi.sh)
md5sums=('7e2392a28bc3fcfb0618c0395b1fc3fd'
         '061e5a5fe148e29dbac63fc027c26de0')

build() {
  cd "$srcdir"
  gendesk -f -n --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc" \
    --name='AOI (Art of Illusion)' \
    --exec='java -Xmx512m -jar /usr/share/java/aoi/ArtOfIllusion.jar'
}

package() {
  install -dm755 "$pkgdir/usr/share/java"
  cp -r . "$pkgdir/usr/share/java/aoi"
  install -Dm755 aoi.sh "$pkgdir/usr/bin/aoi"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
