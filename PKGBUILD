# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=arch-audit
pkgver=0.1.2
pkgrel=3
pkgdesc='An utility like pkg-audit based on Arch CVE Monitoring Team data'
url='https://github.com/ilpianista/arch-audit'
makedepends=('cargo')
arch=('i686' 'x86_64')
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::https://github.com/ilpianista/arch-audit/archive/$pkgver.tar.gz"
        'arch-audit.service' 'arch-audit.tempfile.conf' 'arch-audit.timer')
md5sums=('7f0115ebb9d3801aec5ff53c490ccf76'
         '2401eefbfb11627d9aaf14e98f350d3c'
         '3e648959b5656a8cec805d79a0bb3451'
         '223d953fca28e71af0c5c2feb75e5be8')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

#  install -Dm644 "${srcdir}/arch-audit.service" "${pkgdir}/usr/lib/systemd/system/arch-audit.service"
#  install -Dm644 "${srcdir}/arch-audit.timer" "${pkgdir}/usr/lib/systemd/system/arch-audit.timer"
#  install -Dm644 "${srcdir}/arch-audit.tempfile.conf" "${pkgdir}/usr/lib/tmpfiles.d/arch-audit.conf"
}
