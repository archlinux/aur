# Maintainer: Xavier Francisco <echo moc.liamg@ocsicnarf.n.reivax | rev>

_pkgname=process-compose
pkgname=process-compose-bin
pkgver=1.122.0
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
sha256sums_x86_64=('9b6dbc38324c0b0481f1cd1dd828ffdc78117129ec797678f4bf8c4023311281')
sha256sums_aarch64=('52fa7d5a2d5e0db470faec5976204fc215ed7e3d13689e930cf522becfb63778')
sha256sums_armv7h=('148efe002326a683c9ca9d58c7e442efb051ff5e84182fca04737bb120b8e2ce')

package() {
  install -Dm755 process-compose "$pkgdir/usr/bin/process-compose"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir"
  ./usr/bin/process-compose completion bash 2>/dev/null | install -Dm644 /dev/stdin usr/share/bash-completion/completions/process-compose
  ./usr/bin/process-compose completion zsh 2>/dev/null | install -Dm644 /dev/stdin usr/share/zsh/site-functions/_process-compose
  ./usr/bin/process-compose completion fish 2>/dev/null | install -Dm644 /dev/stdin usr/share/fish/vendor_completions.d/process-compose.fish
}
