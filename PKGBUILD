# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.11.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/6BaLT3NTuTR/ngrok-v3-3.11.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/8igXKoUbqiu/ngrok-v3-3.11.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/9TqyoTepBjy/ngrok-v3-3.11.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/9bUxr2mA92G/ngrok-v3-3.11.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('34af64c8a0babe3d99b3ef9071dc089f81c26090fe196088478076ca5f8e1861')
sha256sums_x86_64=('c4755d5c10926e7e199e755b387e2436c53573843be3bdeb6c384eb5087cdd35')
sha256sums_armv7h=('01cf3c0b1e84a2c89854c55d5f56fad4440dd3f23dd71d3601482620eb21efec')
sha256sums_aarch64=('3639f1d06c76f9d4d3b830eae6f98d2daa27de3234e1b57c6afd6e589d1dc730')

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
