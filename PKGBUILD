# Maintainer: Nicolas Stalder <n+archlinux@stalder.io>
# Helpful suggestions by Foxboron
pkgname=solo2-cli-bin
pkgver=0.1.1
pkgrel=2
pkgdesc='Solo 2 CLI'
arch=('x86_64')
url="https://github.com/solokeys/solo2-cli"
license=(Apache MIT)
# we only need `libudev.so`, during build we also need `pkgconfig/udev/.pc`
depends=(systemd-libs ccid)
# note we do not need Arch `hidapi` package here, it's a git submodule of Rust hidapi
makedepends=(git systemd)
provides=(solo2-cli)
conflicts=(solo2-cli)

source=(
  "solo2::${url}/releases/download/v${pkgver}/solo2-v${pkgver}-x86_64-unknown-linux-gnu"
  "70-solo2.rules::${url}/releases/download/v${pkgver}/70-solo2.rules"
  "solo2.bash::${url}/releases/download/v${pkgver}/solo2.completions.bash"
  "solo2.zsh::${url}/releases/download/v${pkgver}/solo2.completions.zsh"
  "LICENSE-MIT::${url}/raw/v${pkgver}/LICENSE-MIT")
sha256sums=('0babee0afd2a2b1859a6ef373c0f2b65b6c3ee20fbffae6918d4b6c29b37bad9'
            '4133644b12a4e938f04e19e3059f9aec08f1c36b1b33b2f729b5815c88099fe3'
            '8cff104a72d7af2292c2804af14a934cb57ae8dbf4b721c0acaf5aa4952d099d'
            'c8bf857d31c72c348bd7c83ea28d2c5f584603b0bd8cdc61759972b5309d1f83'
            'bdc889204ff84470aaad9f6fc66829cd1cdfb78b307fe3a8c0fe7be5353e1165')

package() {
  install -Dm755 solo2 "$pkgdir/usr/bin/solo2"
  install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgnamefull/LICENSE-MIT"

  # completions
  install -Dm644 solo2.zsh "$pkgdir/usr/share/zsh/site-functions/_solo2"
  install -Dm644 solo2.bash "$pkgdir/usr/share/bash-completion/completions/solo2"

  # udev rule
  install -Dm644 70-solo2.rules -t "$pkgdir/usr/lib/udev/rules.d"
}
