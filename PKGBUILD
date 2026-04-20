# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.38.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/dVQUHT93uta/ngrok-v3-3.38.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/5j86fhSxcjR/ngrok-v3-3.38.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/kiBpoVbc5Sj/ngrok-v3-3.38.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/8WDU8f6L8Ny/ngrok-v3-3.38.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('984f6c690dc908de4d2c17bd5dffe761ca8a442334c3d6d625fc2a53ea38b236')
sha256sums_x86_64=('68c15bca3e334fe56f6de092c0d03c959ef8a012f427b797f536083c298301e6')
sha256sums_armv7h=('5b33fbd3413bda32485bbfcaa9ed81718a231579bb1ca2106d229dc50738b04e')
sha256sums_aarch64=('26d752e7c359ca7f20e7a33b31cd54f144c73fa27f413748cdac51d0c846f094')

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
