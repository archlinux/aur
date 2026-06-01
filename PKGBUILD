# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.6
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/6wd2unL6ws2/ngrok-v3-3.39.6-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/4Ya4MhxRttX/ngrok-v3-3.39.6-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/eKam8qUP5ck/ngrok-v3-3.39.6-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/82ArcYikz9L/ngrok-v3-3.39.6-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('2885a955cd5162bed8c50beb4cd9839653f88cdc5279b261ba9c2be8b9d6c732')
sha256sums_x86_64=('6efc7d5b055af19957a1667bc4c7a08fde931858e122a4c2c8dece4766458d61')
sha256sums_armv7h=('6fc6b410649b91b311901ab6ccff442720555f63ee40002267ab126684bf3857')
sha256sums_aarch64=('dbb22df857a6fd827c7b5b2023e552de97a3715af0521833b8e4719c54bd2904')

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
