# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.3.4
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/99d4KobYYHN/ngrok-v3-3.3.4-linux-amd64")
source_i686=("https://bin.equinox.io/a/3iiMKzJiBb/ngrok-v3-3.3.4-linux-386")
source_armv7h=("https://bin.equinox.io/a/2VZGKNPHQqs/ngrok-v3-3.3.4-linux-arm")
source_aarch64=("https://bin.equinox.io/a/2XmLxPHmx2B/ngrok-v3-3.3.4-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('e46b1bfa8afe28b2c5a7630773ab2d8fc1c91ac42e262356c1cec1197e754419')
sha256sums_x86_64=('11536e5a001de5efa9a6d9d6f33b0ed2dc653216278fe0314f9ca98c20137a7f')
sha256sums_armv7h=('08d7b27407005c9a34a850090527c1398e86a1a2fa090aea2caee40cb18902fe')
sha256sums_aarch64=('1e12cedb3378d25012c3cd94f960123b4d8b99301d52ad9c30df9e698ed1fa2d')

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
