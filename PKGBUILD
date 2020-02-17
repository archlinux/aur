# Maintainer: Hao Long <aur@esd.cc>

pkgname=mixed-content-scan
pkgver=2.9
pkgrel=1
pkgdesc="Scan your HTTPS-enabled website for Mixed Content"
arch=(any)
url="https://github.com/bramus/mixed-content-scan"
license=(MIT)
provides=('mixed-content-scan')
conflicts=('mixed-content-scan')
depends=('php')
makedepends=('composer')
source=("https://github.com/bramus/mixed-content-scan/archive/${pkgver}.tar.gz")
sha256sums=('90ed047f3a074b976e297973c228b7d5cc76ea647f11dec347031b203f8885fe')

build() {
  cd "$pkgname-$pkgver"
  composer install --no-dev
}

package() {
  cd "$pkgname-$pkgver"
  # Depends
  install -d -m755 "${pkgdir}/usr/share/$pkgname/"
  cp -r src "${pkgdir}/usr/share/$pkgname/"
  cp -r vendor "${pkgdir}/usr/share/$pkgname/"
  # Binary
  install -Dm755 bin/mixed-content-scan "${pkgdir}/usr/share/$pkgname/bin/mixed-content-scan"
  install -d -m755 "${pkgdir}/usr/bin"
  ln -sr "${pkgdir}/usr/share/$pkgname/bin/mixed-content-scan" "${pkgdir}/usr/bin/mixed-content-scan"
  # License
  install -Dm644 LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
