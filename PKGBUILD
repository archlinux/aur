# Maintainer: Donald Webster <fryfrog@gmail.com>
pkgname="ubooquity"
pkgver="2.1.1"
pkgrel=1
pkgdesc="Home server for comics and ebooks."
arch=(any)
url="https://vaemendis.net/ubooquity/"
license=('custom')
depends=('java-runtime-headless>=8')
optdepends=('java-runtime>=8: For Ubooquity GUI')
install='ubooquity.install'
source=("http://vaemendis.net/ubooquity/downloads/Ubooquity-${pkgver}.zip"
        'ubooquity.service'
        'ubooquity.sysusers')
noextract=()

sha512sums=('70d0d9f6aec9e80342ab338b03ebdd8e8aa54e0cd24c914a12a785167296d78ab041bebf4f73affb2a71b97a58ea18bb0e813c88377f0d4a45bdb12550a4b25e'
            'c900d561c80c17c8f1f88a1b10871670b6ba4b9e755f3b6fef0e458946d1d81c8e5a60606b1a6d5a2a31d67772ccb2343ea806c606af6b5fd28d2cf40d1581af'
            'd4165d6e22b5e15e308f197ba1193b9a8724a327622f41af0baf451053b55b0280cddcea96e2d16772d7f055a980336de8459b43687431aacec9d164dc63eb9e')


package() {
  cd "$srcdir"
  install -d -m 755 "${pkgdir}/var/lib/ubooquity"
  install -d -m 755 "${pkgdir}/usr/lib/ubooquity"
  cp -dpr --no-preserve=ownership "${srcdir}/Ubooquity.jar" "${pkgdir}/usr/lib/ubooquity"
  install -D -m 644 "${srcdir}/ubooquity.service" "${pkgdir}/usr/lib/systemd/system/ubooquity.service"
  install -Dm644 "$srcdir/ubooquity.sysusers" "$pkgdir/usr/lib/sysusers.d/ubooquity.conf"
}
