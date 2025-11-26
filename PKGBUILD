# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.33.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/bNzUz3YQtcB/ngrok-v3-3.33.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/7jCkVgxrtdP/ngrok-v3-3.33.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/hPGy7FMQzZZ/ngrok-v3-3.33.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/8Ke6HQWUP1A/ngrok-v3-3.33.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('388e3247c39c744dd38394a4cf4b1f3ce0940d2f8e54d6ed15b276f1e98b366a')
sha256sums_x86_64=('7d5cf30be47a38d937958dff61a2b175a289bdbf72fdc20774a6dceeaaaa3dbf')
sha256sums_armv7h=('6329f264fc94f3d9a344a538de2394c69b680eda1a095e3fdf2e8878a7ca9757')
sha256sums_aarch64=('b46a58629343017e0877a02e533b889224695d0479275fe6f3a6b84b16e0f8dd')

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
