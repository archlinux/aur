# Maintainer: Gomasy <nyan@gomasy.jp>

pkgname=rbfeeder
pkgver=1.0.10+bookworm
pkgrel=1
pkgdesc="Software for uploading ADS-B data to RadarBox24.com"
arch=('armv6h' 'armv7h' 'aarch64')
url="https://www.radarbox.com/sharing-data"
license=('GPL2')
depends=('protobuf-c' 'jansson' 'rtl-sdr=1:0.8.0')
source=(
        'rbfeeder.sysusers'
        'rbfeeder.tmpfiles')
source_armv6h=("https://apt.rb24.com/pool/main/r/rbfeeder/rbfeeder_${pkgver}_armhf.deb")
source_armv7h=("https://apt.rb24.com/pool/main/r/rbfeeder/rbfeeder_${pkgver}_armhf.deb")
source_aarch64=("https://apt.rb24.com/pool/main/r/rbfeeder/rbfeeder_${pkgver}_arm64.deb")
sha256sums=(
            '3fb1dae902740e84254a2548c5d81fff18b18658ed408576a438968e43e51746'
            'd8d127259681d44b8d731c80c14658be5fcac44cf5329601dd6d89b1a4d7e82a')
sha256sums_armv6h=('44486643d690d87979ab9463dc108f960dd54cffc16a53fe11ee48e82cad7793')
sha256sums_armv7h=('44486643d690d87979ab9463dc108f960dd54cffc16a53fe11ee48e82cad7793')
sha256sums_aarch64=('ef10faa6b7ebe0f49f403096973a476ba89fa866b568d78a39f64cbcaa5edfaf')
backup=('etc/rbfeeder.ini')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"
  mv "$pkgdir/lib" "$pkgdir/usr/"

  install -Dm644 rbfeeder.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 rbfeeder.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"
}
