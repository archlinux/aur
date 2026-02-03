# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.36.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/nnwTtQab67Z/ngrok-v3-3.36.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/iAtRF1PzCck/ngrok-v3-3.36.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/hqJHefJ98Ni/ngrok-v3-3.36.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/fQTzr6rNEaY/ngrok-v3-3.36.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('d3de254b64b2eb5fb42823a0055971c4ed35026c5e915cc037c7704bace62208')
sha256sums_x86_64=('c16410e44063ba03d44601213c81541f68acc19f91514ba614010a9d32c3bdc0')
sha256sums_armv7h=('816fc0f52c3a3c151bdabf390a5f75b64186f7fa16c264861f8d790f0a98eaa7')
sha256sums_aarch64=('0343cb37317bea89fe85519450b81dfa094655a017a0def0805c59b2309e980b')

# In order to make Ngrok's built-in updater happy, we need to avoid modifying the binary
options=(!strip)

package() {
  BASH_COMPLETION_DIR="$pkgdir/usr/share/bash-completion/completions"
  ZSH_COMPLETION_DIR="$pkgdir/usr/share/zsh/site-functions"

  # Copy terms of service to license directory
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" TERMS-OF-SERVICE.txt

  cd "${srcdir}"

  # Install the program.
  install -Dm755 "ngrok" "${pkgdir}/usr/bin/ngrok"

  # Generate completion for bash and zsh
  mkdir -p "$BASH_COMPLETION_DIR" "$ZSH_COMPLETION_DIR"
  SHELL=/usr/bin/bash ${pkgdir}/usr/bin/ngrok completion > "$BASH_COMPLETION_DIR/ngrok"
  SHELL=/usr/bin/zsh ${pkgdir}/usr/bin/ngrok completion  > "$ZSH_COMPLETION_DIR/_ngrok"
}

# vim: ft=sh ts=2 sw=2 et
