# Maintainer: Bethropolis <bethropolis@users.noreply.github.com>
pkgname=bgrun-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="Background process runner for development and AI workflows (precompiled binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/bethropolis/bgrun"
license=('MIT')
provides=('bgrun' 'bgrun-daemon')
conflicts=('bgrun')

source_x86_64=("https://github.com/bethropolis/bgrun/releases/download/v${pkgver}/bgrun_${pkgver}_linux_x86_64.tar.gz")
source_aarch64=("https://github.com/bethropolis/bgrun/releases/download/v${pkgver}/bgrun_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=('SKIP')
sha256sums_aarch64=('SKIP')

package() {
  cd "${srcdir}"

  # Install binaries
  install -Dm755 bgrun "${pkgdir}/usr/bin/bgrun"
  install -Dm755 bgrun-daemon "${pkgdir}/usr/bin/bgrun-daemon"

  # Generate and install shell completions
  mkdir -p "${pkgdir}/usr/share/bash-completion/completions"
  ./bgrun completions --shell bash > "${pkgdir}/usr/share/bash-completion/completions/bgrun"

  mkdir -p "${pkgdir}/usr/share/fish/vendor_completions.d"
  ./bgrun completions --shell fish > "${pkgdir}/usr/share/fish/vendor_completions.d/bgrun.fish"

  mkdir -p "${pkgdir}/usr/share/zsh/site-functions"
  ./bgrun completions --shell zsh > "${pkgdir}/usr/share/zsh/site-functions/_bgrun"

  # Generate and install CLI man page
  mkdir -p "${pkgdir}/usr/share/man/man1"
  ./bgrun completions --man > "${pkgdir}/usr/share/man/man1/bgrun.1"

  # Install static daemon man page
  install -Dm644 docs/man/bgrun-daemon.1 \
    "${pkgdir}/usr/share/man/man1/bgrun-daemon.1"
}
