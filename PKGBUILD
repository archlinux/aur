# Maintainer: robertfoster
pkgname=netsukuku-rs-bin
pkgver=0.1.7 # renovate: datasource=github-releases depName=M0Rf30/netsukuku-rs
pkgrel=1
pkgdesc="Rust reimplementation of the Netsukuku mesh routing protocol: QSPN v2, Hooking, Coordinator, PeerServices, ANDNA (prebuilt static binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/M0Rf30/netsukuku-rs"
license=('GPL-3.0-or-later')
depends=()
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
backup=('etc/ntkd/ntkd.toml')

# Fetched from the tag rather than carried locally: upstream keeps the unit and default config in
# contrib/systemd/, beside the code that decides what they must contain. Local copies drifted once
# already — the unit lacked CAP_NET_BIND_SERVICE for three releases, so no install could bind the
# default port 269.
source=("ntkd.service::${url}/raw/v${pkgver}/contrib/systemd/ntkd.service"
  "ntkd.toml::${url}/raw/v${pkgver}/contrib/systemd/ntkd.toml")
sha256sums=('7f770bece8fdd52a7761951de92c2b5ff45ada09e24d194b2f4cb3b76198c660'
  '92e4e2fa58defd6f809bdda8df063e5dc947cb9d71a7df538a06586608b38fb1')

package() {
  install -Dm0755 "$srcdir/ntkd" \
    "$pkgdir/usr/bin/ntkd"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcdir/README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 "$srcdir/ntkd.service" \
    "$pkgdir/usr/lib/systemd/system/ntkd.service"
  install -Dm644 "$srcdir/ntkd.toml" \
    "$pkgdir/etc/ntkd/ntkd.toml"
}

source_x86_64=("ntkd-${pkgver}-x86_64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/ntkd-${pkgver}-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("ntkd-${pkgver}-aarch64-unknown-linux-musl.tar.gz::${url}/releases/download/v${pkgver}/ntkd-${pkgver}-aarch64-unknown-linux-musl.tar.gz")

sha256sums_x86_64=('d51f0ef85961c9ecc756539b39ce056c3f8e84e575378fab16e6106f98c4165d')
sha256sums_aarch64=('c660540ffbd66308f1f460af71970a750dc31ee8617d3e8b7832512940afe183')

