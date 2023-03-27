# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.2.2
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/byftSCzg1Y8/ngrok-v3-3.2.2-linux-amd64")
source_i686=("https://bin.equinox.io/a/ax5NwThX2kT/ngrok-v3-3.2.2-linux-386")
source_armv7h=("https://bin.equinox.io/a/2D2x3RwGy66/ngrok-v3-3.2.2-linux-arm")
source_aarch64=("https://bin.equinox.io/a/kYLZ4UkfYc5/ngrok-v3-3.2.2-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('afc4907abb91dd0304d0d2a8a52158b2cb23f51fb5d895697b954b496febc3a9')
sha256sums_x86_64=('ff501a5071aeb4ae7c3542ef8d7507f2c8c955262cf0333dfef61feb56380891')
sha256sums_armv7h=('93aafb8ed17b60cf2ac3f50f471190d37ddb34bf544a5ac4b2fc4bd57c7d219e')
sha256sums_aarch64=('b4e868fa7cb0a63e4df4d21d6d5b6ad478a1d52438eccbb5fa0ba4a729e641c0')

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
