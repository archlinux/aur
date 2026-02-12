# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.36.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/jqupxo64tjZ/ngrok-v3-3.36.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/i1mFvBbXbEj/ngrok-v3-3.36.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/cGc3SKi82Ga/ngrok-v3-3.36.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/cz1rcLPXdYs/ngrok-v3-3.36.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('d41c8f8465f931f45ab4286c9858e481dd378535cca192ad431ca1f59a7e3b8e')
sha256sums_x86_64=('4fe9d21be38fe8d4360b692543a2cc7345fc291b54a82ea99e7d33e46cadb765')
sha256sums_armv7h=('4d613f4954c6f562aa839b3188b7500b42366d25f0d0c0e1c470a3288c759c23')
sha256sums_aarch64=('d04cc4650896e4f324e624247669f7b0d45ba28a19535fc3615d11c7b726a97e')

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
