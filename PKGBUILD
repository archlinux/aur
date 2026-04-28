# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/gPMd5C759aA/ngrok-v3-3.39.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/mWtT7DuJgRx/ngrok-v3-3.39.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/8wihRqCnSK8/ngrok-v3-3.39.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/9ZDccApssM9/ngrok-v3-3.39.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('e8aabf0a67d8a4940124fae96634e7138e7b39746de08cf2a5be26588b867352')
sha256sums_x86_64=('452835f7b24a5d50354e0bab6f63d0faae24aa3cd416e77c6e88c20175e4277d')
sha256sums_armv7h=('8043feeba008eaaf26b7a6cf6bfcc430bdf7c70131bd202e0e78ea018276d0cd')
sha256sums_aarch64=('7bca7d7d9c9ba286a7af3db6dad10dd9d245b435fac4ccae4052f6c6d735911e')

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
