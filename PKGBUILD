# Maintainer: Andrea Scarpino <andrea@archlinux.org>

pkgname=arch-audit-git
pkgver=0.1.5.r4.g0685603
pkgrel=1
pkgdesc='An utility like pkg-audit based on Arch CVE Monitoring Team data'
url='https://github.com/ilpianista/arch-audit'
depends=('curl')
makedepends=('cargo' 'pkg-config' 'git')
arch=('i686' 'x86_64')
license=('MIT')
source=('git://github.com/ilpianista/arch-audit.git')
md5sums=('SKIP')

pkgver() {
  cd arch-audit
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd arch-audit
  cargo build --release
}

package() {
  cd arch-audit
  install -Dm755 "target/release/${pkgname}" "$pkgdir/usr/bin/${pkgname}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  install -Dm644 systemd/arch-audit.service "${pkgdir}/usr/share/${pkgname}/arch-audit.service"
  install -Dm644 systemd/arch-audit.timer "${pkgdir}/usr/share/${pkgname}/arch-audit.timer"
}
