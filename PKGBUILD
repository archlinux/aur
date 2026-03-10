# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.37.2
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/e3qN3YYBf9Z/ngrok-v3-3.37.2-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/mYc7xj1Vfj6/ngrok-v3-3.37.2-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/m5VgkfbHJ1U/ngrok-v3-3.37.2-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/gVAqkNchcmU/ngrok-v3-3.37.2-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('20a33670f4d12ec7fae2f22a03ce7f4a0939657335b2552537f7dc63f750ec0f')
sha256sums_x86_64=('fb0125fed6eb5f918cd80532f108574f6ef4e3aa0e158cee75da36a8d9f17325')
sha256sums_armv7h=('03169d4eb5c84376e6012bba6244cf1bd5c88b02dac9915cfb60944df15bcb9f')
sha256sums_aarch64=('0ee0dff84a6d13f8a24f56c47a5cf3385d7580498a6855eec82ecbdbe2094125')

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
