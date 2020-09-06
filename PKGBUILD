# Maintainer : ko1N <ko1N1337@gmail.com>

pkgver=0.1.1
pkgname=memflow-cli-git
pkgrel=2
pkgdesc="Daemon and CLI for the memflow physical memory introspection framework"
arch=(i686 x86_64)
url="https://github.com/memflow/memflow-cli"
license=('MIT')
depends=(fuse)
makedepends=(git rust cargo)
install=daemon.install
source=("git+https://github.com/memflow/memflow-cli")
sha256sums=("SKIP")

build() {
  cd "${pkgname%-git}"
  cargo build --workspace --release --all-features
}

package() {
  cd "${pkgname%-git}/target/release"
  install -Dm755 memflow-cli "${pkgdir}/usr/bin/memflow"
  install -Dm755 memflow-daemon "${pkgdir}/usr/bin/memflowd"
  install -D "../../daemon.conf" "${pkgdir}/etc/memflow/daemon.conf"
  install -D "../../memflow.service" "${pkgdir}/etc/systemd/system/memflow.service"
  install -Dm644 "../../LICENSE" "${pkgdir}/usr/share/licenses/memflow/LICENSE"
}
