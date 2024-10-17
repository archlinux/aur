# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.18.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/mkngf8RqbVX/ngrok-v3-3.18.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/8HZJAQqmAAZ/ngrok-v3-3.18.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/7Q9UbHcN8jG/ngrok-v3-3.18.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/5y7SUjAvEU9/ngrok-v3-3.18.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('e066fd87b8531c4a36265b97ecf6855498aad81df3b0caa4827a8fc514388f3b')
sha256sums_x86_64=('6670189f066a470a7d69bf59ec3f524464c20db75e790fe8eb0d379f3f25974a')
sha256sums_armv7h=('50218325489aed4cd2443f4fd5c4ab454a5b7632dcbb2bb793736d92c269cc7b')
sha256sums_aarch64=('dd2c5737dbdb15bc09b48c90551dcd2d2669e148787407026980354419f5e129')

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
