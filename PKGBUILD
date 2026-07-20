# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=process-compose
pkgname=process-compose-bin
pkgver=1.120.0
pkgrel=1
pkgdesc="Scheduler and orchestrator to manage non-containerized applications (prebuilt)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/F1bonacc1/process-compose"
license=('Apache-2.0')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!debug' '!strip')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/process-compose_linux_amd64.tar.gz")
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/process-compose_linux_arm64.tar.gz")
source_armv7h=("$pkgname-$pkgver-armv7h.tar.gz::$url/releases/download/v$pkgver/process-compose_linux_arm.tar.gz")
sha256sums_x86_64=('3792e1ed9f383832eb2362154444e8564fbc8e7e8e7cff8754c68aea5eca086e')
sha256sums_aarch64=('c5f4fcfc63e849279ac531bce2394a918fb28746339088a7d3d02bb5fb218a68')
sha256sums_armv7h=('039791eaeff304b96ba409a9b8477a7c5417afd5c7ada4fad21a0c36237a2343')

package() {
  install -Dm755 process-compose "$pkgdir/usr/bin/process-compose"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir"
  ./usr/bin/process-compose completion bash 2>/dev/null | install -Dm644 /dev/stdin usr/share/bash-completion/completions/process-compose
  ./usr/bin/process-compose completion zsh 2>/dev/null | install -Dm644 /dev/stdin usr/share/zsh/site-functions/_process-compose
  ./usr/bin/process-compose completion fish 2>/dev/null | install -Dm644 /dev/stdin usr/share/fish/vendor_completions.d/process-compose.fish
}
