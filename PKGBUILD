# Maintainer: runxhq <dev@runx.ai>
pkgname=runxhq-bin
pkgver=0.9.1
pkgrel=1
pkgdesc="Runx CLI - native governed runtime for agent skills, tools, graphs, and packets."
arch=('x86_64' 'aarch64')
url="https://runx.ai"
license=('Apache-2.0')
provides=('runxhq')
conflicts=('runx' 'runx-bin')
source_x86_64=("https://github.com/runxhq/runx/releases/download/cli-v0.9.1/runx-0.9.1-x86_64-unknown-linux-musl.tar.gz")
source_aarch64=("https://github.com/runxhq/runx/releases/download/cli-v0.9.1/runx-0.9.1-aarch64-unknown-linux-musl.tar.gz")
sha256sums_x86_64=('59eee2af81d24d0f8ba2416e2bac55d147ed93693e6a41ffe7c2cfd5cba98cc7')
sha256sums_aarch64=('0181826afc39e49bca26fa7fd2d16c08d816ec94220c9553481d9c655eba705d')

package() {
  case "$CARCH" in
    x86_64) target="x86_64-unknown-linux-musl" ;;
    aarch64) target="aarch64-unknown-linux-musl" ;;
    *) echo "unsupported architecture: $CARCH" >&2; return 1 ;;
  esac
  install -Dm755 "runx-${pkgver}-${target}/runx" "$pkgdir/usr/bin/runx"
  install -Dm755 "runx-${pkgver}-${target}/runx-js-worker" "$pkgdir/usr/bin/runx-js-worker"
}
