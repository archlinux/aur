# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.37.6
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/bGFRQXqGqa2/ngrok-v3-3.37.6-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/ansZ5KSm4uB/ngrok-v3-3.37.6-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/Tr1HrNz5x4/ngrok-v3-3.37.6-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/6XV51QEKt61/ngrok-v3-3.37.6-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('899da5223e3179d13e5adf122dbd254d67434d8bc10326a10163962885aa390d')
sha256sums_x86_64=('cb00a5d30896f46dad73776ca83a4ef8022e8a67ef63b3833a271a1f6379eeb0')
sha256sums_armv7h=('8bf21f728b7a7226cef390a0ee5213eb5e1ca8517614b6c9fb5522462209b7a0')
sha256sums_aarch64=('f9eb38a8360246328f6c5754fa1435063288a2dc99fe9a9b016354e012089bb4')

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
