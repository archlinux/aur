# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.24.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/ncvUwsMh83Z/ngrok-v3-3.24.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/bJEG17YMwyh/ngrok-v3-3.24.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/itMPXwqauE6/ngrok-v3-3.24.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/heJaGvhXc7s/ngrok-v3-3.24.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('7ee8c43e847ba20488c61100842c79125b9165144620a12e5edf8a0a57b11c76')
sha256sums_x86_64=('841cf37bde6f7b5ad9e08f06f69f1237c8b1a8b5e29e390ff55b8c6af6f70ff8')
sha256sums_armv7h=('dfb7fb23d095b5c8a28667f4b1b937679fa0ea49b3f76dbf3b9ca3f52fab2de1')
sha256sums_aarch64=('73e999d75ea247558c758b0ae64c31e1e5ae5cd7804a410158d22bdd8cde6602')

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
