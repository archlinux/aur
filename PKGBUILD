# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.15.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/MZ6q6hHzWo/ngrok-v3-3.15.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/dHcXtJkYYuY/ngrok-v3-3.15.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/cRtUHNzE2Xj/ngrok-v3-3.15.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/cbzpK8itFNu/ngrok-v3-3.15.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('1c5afcda83b9b2c1c5ec530e5056bd03eb8a7e0a67e45a1f862976c0c7b2d46d')
sha256sums_x86_64=('21f2f967827dde028afdbf33736c37293687874b60acdae708677fa7280123b2')
sha256sums_armv7h=('67123a1f30eb124aee069beedd8fc31ff1f3ce331be7baf3a82015175ae1004f')
sha256sums_aarch64=('6517cf921c2eb6b7ff6eb183e4cfff9055f53ca3f473f6b5ec3624b3b368c5fd')

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
