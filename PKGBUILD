# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.8.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/aFW7oPbJx8A/ngrok-v3-3.8.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/3jqEchRhyDw/ngrok-v3-3.8.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/jmBTN7BK7R2/ngrok-v3-3.8.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/2P74293jZsB/ngrok-v3-3.8.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('962a49c13f36a1d640dd206dd2efff219262078dcc28d3e72289f657aa4c5107')
sha256sums_x86_64=('9e04778b3c2ca73171336f52c25f8bc0590a2461471600a62d0d1dbe10bb9b1f')
sha256sums_armv7h=('8ad636b367d901c36f1602fc20afe38fadb5c80df6dd1aab4e4ede7a3a58bf8f')
sha256sums_aarch64=('8c933b5f58c3f805008d600d9c6d1cbfa578b418ed61eda54ba17ec10ff6f609')

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
