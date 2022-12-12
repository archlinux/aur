# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.1.0
pkgrel=2
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/7UAdGDeyg6i/ngrok-v3-3.1.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/26QHEgwoE5Z/ngrok-v3-3.1.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/hAZN7QUBMxw/ngrok-v3-3.1.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/5skoQje3DKb/ngrok-v3-3.1.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('85f1da543cd77021862c757186220c414b849bb25a31c9e8cc280bc843bb3ba6')
sha256sums_x86_64=('2f6d941d421987daa37fbf3c726d875c9e3ef1c2e26bbf452223d64c0d2b2adb')
sha256sums_armv7h=('27ace158cadd1e5e5c6e9b2f0652bdf7ab0d4cf39e3d9454fbefcc6c6ec03d56')
sha256sums_aarch64=('668cc681c4d5bd6b4d205b8332091f8236575ebebd900b5ef9d273116471d820')

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
