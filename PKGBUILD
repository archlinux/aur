# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.16.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/8N9hQcCu9Hs/ngrok-v3-3.16.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/7VLheKLWQAn/ngrok-v3-3.16.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/i4USYcHBoBd/ngrok-v3-3.16.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/iBqRL7H3cqT/ngrok-v3-3.16.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('271f61c410b9b544f1f7f4640ad3bf75fc9432a131daa96025b43afbd65670e5')
sha256sums_x86_64=('32451338986079eda1832ce02d7033812166ed7b6e7a5fadaf5d914487175bd6')
sha256sums_armv7h=('fe5bbaa41d34b13350f619b246e8770622e37be2f6c989e1a190273f6d882dee')
sha256sums_aarch64=('0a28941b2dbc7c2e24b646d3d427753fc5647651104baccd20cb77973a930268')

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
