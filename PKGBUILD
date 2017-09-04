# Maintainer: Jean Lucas <jean@4ray.co>

pkgname=cpt
pkgver=0.5.0
pkgrel=1
pkgdesc="A tool for flashing ubports onto devices"
arch=('any')
url="https://ubports.com"
license=('GPL3')
depends=('python' 'android-tools')
source=("${pkgname}_${pkgver}_all.deb::https://ubports.com/r/downloads-cpt-linux")
sha256sums=('fad3dfa56125ddd9f135af07e4d421784d7121c6bf14abc9ffee38353368fd6f')

package() {
  msg2 "Extracting data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  msg2 "Modifying path to graphic..."
  sed -i "s|gfx|/opt/cpt/gfx|g" "$pkgdir/opt/cpt/cpt.py"

  msg2 "Creating path-accessible link to executable..."
  mkdir "$pkgdir/usr/bin"
  ln -s /opt/cpt/cpt.sh "$pkgdir/usr/bin/cpt"
}
