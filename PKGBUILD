# Maintainer: basxto <archlinux basxto de>
pkgname='asxxxx'
pkgver=5.40
pkgrel=2
pkgdesc='Series of microprocessor cross assemblers for Z80, 6502, 8080, 6800, 1802 and many more'
url='https://shop-pdp.net/ashtml/asxxxx.php'
license=('GPL3')
arch=('x86_64')
depends=('glibc')
makedepends=('unzip')
source=("https://shop-pdp.net/_ftp/asxxxx/asxs$(echo $pkgver|tr . p).zip")
noextract=("asxs$(echo $pkgver|tr . p).zip")
sha256sums=('ac8277b85308b9fdc3e27c50557cc3ba45fe0de85ddc96c936fb25e5fd3a3e22')

prepare() {
  # convert to unix as described in readme
  unzip -L -a -f ${noextract[0]}
}

build() {
  cd "${srcdir}/asxv$(echo $pkgver | fold -w1 | head -n 1)pxx/asxmak/linux/build/"
  make
}


package() {
  cd "${srcdir}/asxv$(echo $pkgver | fold -w1 | head -n 1)pxx/"
  install -d "${pkgdir}/usr/bin/"
  install -Dm755 asxmak/linux/exe/as* asxmak/linux/exe/s19os9 "${pkgdir}/usr/bin/"
  install -d "${pkgdir}/usr/share/${pkgname}/asxhtml/"
  install -Dm644 asxhtml/* "${pkgdir}/usr/share/${pkgname}/asxhtml/"
  install -Dm644 readme.txt changes.txt "${pkgdir}/usr/share/${pkgname}/"
}
