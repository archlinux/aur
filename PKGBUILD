# Maintainer:  Mort Yao <soi@mort.ninja>
# Contributor: TDY <tdy@gmx.com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: dsr <dsr@archlinux.us>

pkgname=aoi
pkgver=3.2.1
pkgrel=1
pkgdesc="A 3D modeling and rendering studio (Art of Illusion)"
arch=('any')
url="http://www.artofillusion.org/"
license=('GPL')
depends=('java-environment')
optdepends=('jmf:  QuickTime animation support'
            'jogl: OpenGL rendering support')
makedepends=('gendesk')
source=(https://sourceforge.net/projects/aoi/files/ArtOfIllusion/3.2.1/Art%20of%20Illusion%203.2.1%20linux.zip/download
        aoi.sh)
md5sums=('7e01b711b497e8ea653bf7f2bef1e1f3'
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
  cp -r . "$pkgdir/usr/share/java/aoi"
  install -Dm755 aoi.sh "$pkgdir/usr/bin/aoi"
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}
