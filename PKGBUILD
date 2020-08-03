# Contributor: Adrian Petrescu <apetresc@gmail.com>
# Maintainer: Adrian Petrescu <apetresc@gmail.com>

pkgname=sabaki
pkgver=0.51.1
pkgrel=2
pkgdesc='An elegant SGF editor for the game of Go'
arch=('any')
url='http://sabaki.yichuanshen.de/'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
install=${pkgname}.install
source=("https://github.com/SabakiHQ/Sabaki/archive/v${pkgver}.tar.gz"
        "${pkgname}.desktop"
        'sabaki.xml')
md5sums=('1640fbf449fb44ecd442adc7e9fe3686'
         '90a84e32adcd0bb63bcd7cfa734232a7'
         'efbd547e892c7781a5ece702d389dd9e')

build() {
  cd $srcdir/Sabaki-$pkgver

  npm install --cache "${srcdir}/npm-cache"
  npm run build
}

check() {
  cd $srcdir/Sabaki-$pkgver
  npm test
}

package() {
  mkdir $pkgdir/opt

  cp -r $srcdir/Sabaki-$pkgver/dist/linux-unpacked $pkgdir/opt/Sabaki
  chmod 4755 $pkgdir/opt/Sabaki/chrome-sandbox
  install -Dm644 ${srcdir}/Sabaki-${pkgver}/logo.png $pkgdir/usr/share/pixmaps/sabaki.png
  install -Dm644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
  install -Dm644 ${srcdir}/${pkgname}.xml ${pkgdir}/usr/share/mime/packages/${pkgname}.xml
}
