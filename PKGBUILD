# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.7
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/jf7V3qGwdFr/ngrok-v3-3.39.7-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/6ajpAacN8wC/ngrok-v3-3.39.7-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/jKvoPv5S4fs/ngrok-v3-3.39.7-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/b5c4oaFyHDg/ngrok-v3-3.39.7-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('9ab3c3374c08b4ab5cdc2341841c53e03a0230f5be8ba2a461d6a0659cd11185')
sha256sums_x86_64=('dbcf481ed21e009f9d68f30d59b097bf8a00a34b99a888d49ed1a91104401fec')
sha256sums_armv7h=('daab13d638dacdad4c8d94b5a61bd226a43d8f8fbd34df8d214d8b9b3fc51214')
sha256sums_aarch64=('a861e00493525a71590718275d03ea643b9dfc1c3af0f0a30e04928cdaf929d6')

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
