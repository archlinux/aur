# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname='mosaic-ck'
pkgver=2.7ck13
_pkgver=27ck13
pkgrel=1
pkgdesc="One of the first graphical web browsers (unsupported port)"
url='http://www.floodgap.com/retrotech/machten/mosaic/'
license=('custom')
arch=('x86_64')
depends=('openmotif' 'libjpeg-turbo' 'libpng12' 'libxmu' 'libxpm' 'zlib')
source=("http://www.floodgap.com/retrotech/machten/mosaic/mosaic${_pkgver}.tar.gz"
#source=("http://www.floodgap.com/retrotech/machten/mosaic/mosaic${_pkgver}-src.zip"
        'force-ansi.patch')
sha256sums=('e73857657f48d31b593a5b22ec51e19dea06707fb510a1bb6ba0b0282eaf4a3f'
            '11813a985506adba6440960c34bc701fbc4da2157a30d2ea650d6e1df8f94558')
provides=('mosaic')
conflicts=('ncsa-mosaic-git')

prepare() {
  cd "${srcdir}/${pkgname}"

  patch -p1 < ../force-ansi.patch
}

build() {
  cd "${srcdir}/${pkgname}"

  make linux
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm0755 "src/Mosaic"              "$pkgdir/usr/bin/Mosaic"
  #install -Dm0644 "desktop/Mosaic.png"      "$pkgdir/usr/share/icons/Mosaic.png"
  #install -Dm0644 "desktop/Mosaic.desktop"  "$pkgdir/usr/share/applications/Mosaic.desktop"

  # license
  install -Dm0644 "COPYRIGHT"               "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
