# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.28.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/hAknv9cDxDf/ngrok-v3-3.28.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/6HZknu5CNLK/ngrok-v3-3.28.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/dvaVJ6X45uW/ngrok-v3-3.28.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/bzQuxSfmMVS/ngrok-v3-3.28.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('bd4a3f33fd6a709281f673eaa86c250636761aa1dc97cdfe4af02f42227f1e7c')
sha256sums_x86_64=('4be82552239ba419d67bda4417fe5dd37de10d8b95cc1a41357197ad969433bf')
sha256sums_armv7h=('33cb7db320c427d328d667b30d21ab94e2491d730642bcdbd0cb42ff67b96963')
sha256sums_aarch64=('6548ff9a52a03a43cb87b5f4ec2b5b2f71477ba27e23a045781664a05ca03d37')

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
