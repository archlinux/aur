# Maintainer: okhsunrog <me at okhsunrog dot dev>
# SPDX-License-Identifier: 0BSD

pkgname=arctern-bin
pkgver=0.3.1
pkgrel=1
pkgdesc='ZFS snapshot and replication daemon with an embedded web console'
arch=('x86_64' 'aarch64')
url='https://github.com/okhsunrog/arctern'
license=('MIT')
depends=('openssh' 'zfs-utils')
provides=("arctern=${pkgver}")
conflicts=('arctern')
install=arctern-bin.install
options=('!strip' '!debug')

source=(
  "arctern.service::${url}/raw/v${pkgver}/packaging/systemd/arctern.service"
  "example-config.toml::${url}/raw/v${pkgver}/docs/example-config.toml"
  "LICENSE.upstream::${url}/raw/v${pkgver}/LICENSE"
)
source_x86_64=(
  "arctern-${pkgver}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/arctern-x86_64-linux-musl.tar.gz"
)
source_aarch64=(
  "arctern-${pkgver}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/arctern-aarch64-linux-musl.tar.gz"
)
sha256sums=('bb6a12ed2f3cba05f7d6827529bc34011f4c84d92718561d6f2520c8c7f9c1af'
            '78d6c9b91d925240c919b16d29f0cd8a751bacd04336d19fc0be2fb1e38fe067'
            'dab21a15eee1c4f6651312e755c6d1fb9e128c68d384dfda0d2ac29dad5c3ed9')
sha256sums_x86_64=('d9c94ffc8cf3b325c626c88701e8205d527f9244f7c8931a3044ab2bc5a477a3')
sha256sums_aarch64=('52fe774f942c82217aeebb335cbd7d4afe7691539a543fdd99fb106d682186c2')

package() {
  install -Dm755 arctern "${pkgdir}/usr/bin/arctern"

  install -Dm644 arctern.service "${pkgdir}/usr/lib/systemd/system/arctern.service"
  sed -i 's|/usr/local/bin/arctern|/usr/bin/arctern|' \
    "${pkgdir}/usr/lib/systemd/system/arctern.service"

  install -Dm644 example-config.toml \
    "${pkgdir}/usr/share/doc/arctern/example-config.toml"
  install -Dm644 LICENSE.upstream \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
