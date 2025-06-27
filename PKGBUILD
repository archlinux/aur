# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.23.3
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/7yBob66spJX/ngrok-v3-3.23.3-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/b1wCnarZmrS/ngrok-v3-3.23.3-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/n6RMdLifSFC/ngrok-v3-3.23.3-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/8WYW3a5h9LK/ngrok-v3-3.23.3-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('3cfcd33218274f930c14c5844b0b07ed01c81ffaebb6888d6ae72cc9d5c81c29')
sha256sums_x86_64=('bcaf7bf49a88fee61fa12cf9d314570e5705da0ee37da58a596fdd426f13afa5')
sha256sums_armv7h=('830eb83677efc5ca792cc4417bf5250b523261780ae4ea9ea600f44fdae9a856')
sha256sums_aarch64=('c4af6d8764f1461796c4d9cb29d6f36ab5d93f096efe377b4715ac5c8734c377')

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
