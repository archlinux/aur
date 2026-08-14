# Maintainer: okhsunrog <me at okhsunrog dot dev>
# SPDX-License-Identifier: 0BSD

pkgname=arctern-bin
pkgver=0.2.2
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
            '82ec35300e5f169a0f8070ab1045fc0663aab70eaf722ffdde5913391ca94285'
            'dab21a15eee1c4f6651312e755c6d1fb9e128c68d384dfda0d2ac29dad5c3ed9')
sha256sums_x86_64=('ebcc4bff0917b865d5dcee0f841566b419fc83a38828d73725234b5ac5d7f17d')
sha256sums_aarch64=('31898ba2abff1467faefb07d14db75b7f61d89c3ace2eafd093c0218630a62ad')

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
