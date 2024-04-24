# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.9.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/2d3ZAS5cS1y/ngrok-v3-3.9.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/4eyRd2Y9zhP/ngrok-v3-3.9.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/jwEoHhyU22A/ngrok-v3-3.9.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/dCoWhZwgRB3/ngrok-v3-3.9.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('6b8b66e5608355dcf913e927a4641821867ecc177d8dce3d0153638748cf305b')
sha256sums_x86_64=('4b149cb7aa4aa97836b663aab205f2707c2b4309779d07cec593d66c1bd5eafa')
sha256sums_armv7h=('d4080caaf7d178c9c04ab26826d9dd190e2c94679aba6ac68afcc9066d1b4eb8')
sha256sums_aarch64=('363c6757ccf511579ed0215b3e9ce723e0bc728d26981ee9c77ceda94d626603')

# In order to make Ngrok's built-in updater happy, we need to avoid modifying the binary
options=(!strip)

package() {
  BASH_COMPLETION_DIR="$pkgdir/usr/share/bash-completion/completions"
  ZSH_COMPLETION_DIR="$pkgdir/usr/share/zsh/site-functions"

  # Copy terms of service to license directory
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" TERMS-OF-SERVICE.txt

  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"

  # Generate completion for bash and zsh
  mkdir -p "$BASH_COMPLETION_DIR" "$ZSH_COMPLETION_DIR"
  SHELL=/usr/bin/bash ${pkgdir}/usr/bin/ngrok completion > "$BASH_COMPLETION_DIR/ngrok"
  SHELL=/usr/bin/zsh ${pkgdir}/usr/bin/ngrok completion  > "$ZSH_COMPLETION_DIR/_ngrok"
}

# vim: ft=sh ts=2 sw=2 et
