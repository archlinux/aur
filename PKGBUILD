# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.10.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/izHycmPvBZH/ngrok-v3-3.10.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/egph8GUssPv/ngrok-v3-3.10.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/jchcT4YFeVL/ngrok-v3-3.10.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/ffe8pmrC7Y7/ngrok-v3-3.10.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('a752db6224e80c7f04fa6f574946634d536ee5d3811833113e2e2a53cca95f11')
sha256sums_x86_64=('75be63a4f8a11d23df5a2a9897a627fefa377f08b1133b0bd92eb713b4277c0d')
sha256sums_armv7h=('3a4b295806128fc37a699590fe923cc294697ff8a8972d5b07de88687999c8d0')
sha256sums_aarch64=('0b83c064d700474565e36d29c4428fc179081867a84ab8a7500d2a58c29661f7')

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
