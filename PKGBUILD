# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.5
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/kKkAkYX8YcH/ngrok-v3-3.39.5-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/kQnxyQSE7xw/ngrok-v3-3.39.5-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/e4kDB2g2hh6/ngrok-v3-3.39.5-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/hvfAEdYTbBQ/ngrok-v3-3.39.5-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('da19120b936df8c16587878ac16adb46291b325ecb5f562ff46784811cc7ec59')
sha256sums_x86_64=('e67c2db250fcb0ca80b29a382a93b6081c12d40e9a2c420e2d4a210da426eeaf')
sha256sums_armv7h=('ac265983209e5af8d6a745653029dce4eef866011d094949cad8185927a0a887')
sha256sums_aarch64=('f666d8c2c8da6996a850cc1f5f7af54ef7ae0483a673b003d7f98470ecb06c58')

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
