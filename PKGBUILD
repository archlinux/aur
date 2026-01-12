# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.35.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/76vdzhNjs7e/ngrok-v3-3.35.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/3xL4uaGye2K/ngrok-v3-3.35.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/a26G6Jn2Sti/ngrok-v3-3.35.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/d7vz8B9YEE3/ngrok-v3-3.35.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('4094488a790bc8a9704c447b39d69ce843b4975ade6bf9ca2c33dd8969834c58')
sha256sums_x86_64=('e744927dceb5c4363271a00f452de3be0f39c23a92ccf000fae38fbe84a246ea')
sha256sums_armv7h=('8ed7f63c8747d64f77f90d1d9301466f197b0d15493e674ed1ee4e7078a8789c')
sha256sums_aarch64=('d1630141ecbe3f642e92971a61f9a0230c9cbc4d2bed29bc2eedfe464b7b1f93')

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
