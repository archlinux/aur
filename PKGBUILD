# Maintainer: Sorah Fukumori <her@sorah.jp>

pkgname=topolvm
pkgver=0.6.0
pkgrel=2
pkgdesc="Capacity-aware CSI plugin for Kubernetes"
arch=('x86_64')
url="https://github.com/topolvm/topolvm"
license=('MIT')
depends=('lvm2')
makedepends=('go-pie' 'protobuf' 'git')
optdepends=('btrfs-progs: for topolvm-node' 'xfsprogs: for topolvm-node')
source=(
  "https://github.com/topolvm/topolvm/archive/v${pkgver}.tar.gz"
  "topolvm-lvmd.service"
)

build() {
  cd "topolvm-$pkgver"
  make build TOPOLVM_VERSION=$pkgver
}

package() {
  cd "topolvm-$pkgver"
  install -Dm0644 "${srcdir}/topolvm-lvmd.service" "${pkgdir}/usr/lib/systemd/system/topolvm-lvmd.service"
  install -Dm0755 build/hypertopolvm "${pkgdir}/usr/bin/hypertopolvm"
  install -Dm0755 build/lvmd "${pkgdir}/usr/bin/topolvm-lvmd"
  ln -s hypertopolvm "${pkgdir}/usr/bin/topolvm-controller"
  ln -s hypertopolvm "${pkgdir}/usr/bin/topolvm-node"
  ln -s hypertopolvm "${pkgdir}/usr/bin/topolvm-scheduler"
}
sha256sums=('d9b6e266dd5e7754d1cdf1b41b9ad419f37fa57a09aa9b346e286be1b5b37e8b'
            '538bb225d39db6dea06ef722969d79ecfd15b3a5cc76612eaa608db50d0c1498')
sha512sums=('73e4e222e3266288bbf2ca1ab1b3bad4295aa9f914e1effc19ad93a216a9d17fb65c1e5f64e45fad065ab969496fa6b19301a974664afede232b551b8f3a087a'
            'b5b357083a6efe8c319868c27a63dc726c5c3ed45cadec50abd4a95c975cd8c81a689739e433fa76c2c6904e2763cd3e7719ad2b6572a90fe4fd2e44250040fb')
