# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.3.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/6wTR9C5G1pu/ngrok-v3-3.3.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/n2sDPvWRHhg/ngrok-v3-3.3.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/bbBqonHqRxm/ngrok-v3-3.3.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/np93VBWWrMi/ngrok-v3-3.3.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('8f6da1ef234a20a0604ce2028bc44b7fa40791bd1adce0529ef256c6a89c5655')
sha256sums_x86_64=('ebe08529ce7ea3ee9cc05a0966e8ee33f5a41d7deeb440a15a6ff80ae2aa4716')
sha256sums_armv7h=('ccd11d1319152ece16aa9f9e6edcac3ff9cd189d712b4da670bda2a79d4feae1')
sha256sums_aarch64=('b08e4ac6858b4179e987e15ecf5648c0e84716c9a17b3726df48c9ce213dc186')

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
