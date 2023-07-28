# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.3.2
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/6o7qTTPqKoF/ngrok-v3-3.3.2-linux-amd64")
source_i686=("https://bin.equinox.io/a/jmzCYkHv24g/ngrok-v3-3.3.2-linux-386")
source_armv7h=("https://bin.equinox.io/a/jn9btHnE3cn/ngrok-v3-3.3.2-linux-arm")
source_aarch64=("https://bin.equinox.io/a/7QfvKK2SFxm/ngrok-v3-3.3.2-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('2ae5227bedb3080c8bd42356407a22847fc11c351ac07a20305edd8cc85bf0a0')
sha256sums_x86_64=('0e43d832e8b521fa5f5cbf5204c9922c928b377be0d30ebf5727947434419936')
sha256sums_armv7h=('f3da4078eed2b585ffbc2a9088d899c48d4fff15703bd506a00fcf77577ed26b')
sha256sums_aarch64=('81af66ada44c90e8d1c6ff3b6697657774ec7d619334903d0494c51228f00363')

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
