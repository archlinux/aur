# Maintainer: hzmi <contact@hzmi.xyz>
pkgname=tack-failover-bin
pkgver=1.7.0
pkgrel=1
pkgdesc="Switch a stateful workload's primary between sites, in step with GitOps"
arch=('x86_64' 'aarch64')
url="https://tack.tako.id"
license=('Apache-2.0')
# The AUR packages tack (ncurses' terminfo tool) and tack-cli also install /usr/bin/tack.
conflicts=('tack' 'tack-cli')
options=('!strip' '!debug')
source_x86_64=("https://github.com/takodotid/tack/releases/download/v${pkgver}/tack-v${pkgver}-linux-amd64.tar.gz")
source_aarch64=("https://github.com/takodotid/tack/releases/download/v${pkgver}/tack-v${pkgver}-linux-arm64.tar.gz")
sha256sums_x86_64=('810ef9778877b38b4cccbc71c67a812bf8a8f98fa5a0a4bfe71b385c28220a82')
sha256sums_aarch64=('8c4d0346c32ac614ab80c29a09e5ea7291d45b90b56978ea60a5b250a66ac288')

package() {
  cd tack-v"${pkgver}"-linux-*/
  install -Dm755 tack "${pkgdir}/usr/bin/tack"
  install -Dm644 -t "${pkgdir}/usr/share/man/man1" man/man1/*.1
  install -Dm644 -t "${pkgdir}/usr/share/doc/tack" README.md
  install -Dm644 -t "${pkgdir}/usr/share/tack" failover.tako.id_sitefailovers.yaml
  ./tack completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/tack"
  ./tack completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_tack"
  ./tack completion fish | install -Dm644 /dev/stdin "${pkgdir}/usr/share/fish/vendor_completions.d/tack.fish"
}
