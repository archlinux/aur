# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.12.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/51NJ3EotHQ6/ngrok-v3-3.12.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/GZm8pVHpyU/ngrok-v3-3.12.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/biPUDk64qVn/ngrok-v3-3.12.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/6RUrYfCrE5g/ngrok-v3-3.12.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('3723b0137d64dab24e13b3a829b9a318f7603bf7e8049462e2ae34cf52b0f66e')
sha256sums_x86_64=('b01811aabc40b94109798577c49291d2ea5e786636dccad03f69d90e278d0f58')
sha256sums_armv7h=('30622f4833faeeabeecc18e60f13ef919769b6c427a5e03abf774d3652c731c7')
sha256sums_aarch64=('43b359867560dc0a15a5e59d4c9176b031c40a360c5fd23c58a420a5523c1da3')

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
