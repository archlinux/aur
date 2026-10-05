# shellcheck disable=SC2034,SC2154
# Maintainer: LightJunction <lightjunction@users.noreply.github.com>
pkgname=mcpmux-bin
pkgver=0.1.1
pkgrel=1
pkgdesc='Minimal authenticated MCP path gateway with HTTP and stdio upstreams'
arch=('x86_64' 'aarch64')
url='https://github.com/TokenNotIncluded/mcpmux'
license=('MIT')
optdepends=('systemd: service management and automatic service account creation')
provides=('mcpmux')
conflicts=('mcpmux')
options=('!strip')
source=("mcpmux-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        'mcpmux.sysusers'
        'mcpmux.tmpfiles'
        'README.md'
        'configuration.md')
source_x86_64=("mcpmux-x86_64-$pkgver.tar.gz::$url/releases/download/v$pkgver/mcpmux-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("mcpmux-aarch64-$pkgver.tar.gz::$url/releases/download/v$pkgver/mcpmux-aarch64-unknown-linux-musl.tar.gz")
sha256sums=('7a919d53db25683d99840ad0d1fe583b0e7432bfa80c1572b99f6327870a4d2f'
            'a4984471d3c1c51e64dbc4524f800f50aa1928e405dee689e7a58b0696a71902'
            '045c17f44bfc907939decbddd25c2f8c6b7a4fd1dee85e68d2afd13ae61c49ae'
            'da705fdf39599d70c4d35e97e2b88a5794e2a5d7996d38447c6c99115072991b'
            '6cc75a040e7e9ef731ca01a8fd59a9fa4a42b44602239d4b25e308814af63dbb')
sha256sums_x86_64=('57195b7b39d72927ebb5db9a185f2845a3719671612a04665a8368cc162b33d0')
sha256sums_aarch64=('35c94cd077066a5fa836b934851cbff7aa92bbad28ebf8ad663a73e590c3ee86')

package() {
  local upstream="mcpmux-$pkgver"
  local binary=mcpmux
  install -Dm755 "$binary" "$pkgdir/usr/bin/mcpmux"
  install -Dm644 "$upstream/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  install -Dm644 configuration.md "$pkgdir/usr/share/doc/$pkgname/docs/configuration.md"
  install -Dm644 "$upstream/packaging/nginx.conf" "$pkgdir/usr/share/doc/$pkgname/nginx.conf"
  install -Dm644 "$upstream/packaging/mcpmux.service" "$pkgdir/usr/lib/systemd/system/mcpmux.service"
  sed -i 's|/usr/local/bin/mcpmux|/usr/bin/mcpmux|g' "$pkgdir/usr/lib/systemd/system/mcpmux.service"
  install -Dm644 mcpmux.sysusers "$pkgdir/usr/lib/sysusers.d/mcpmux.conf"
  install -Dm644 mcpmux.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/mcpmux.conf"
}
