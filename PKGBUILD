# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.23.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/n4PF4C6k3nd/ngrok-v3-3.23.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/fH9FXjZskEA/ngrok-v3-3.23.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/2KWo7nE3WjG/ngrok-v3-3.23.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/fg9jJYwuRNH/ngrok-v3-3.23.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('c1f2ba93ea7829290c4aa6a44f0f1d6fac2a8cedd48e6f88df35b63ed32cd77f')
sha256sums_x86_64=('61ff09e26bc5a0c2716278a02260cb9d907410b641d1e8607d9bf0872aa25963')
sha256sums_armv7h=('d265ba386d8c8bb1bad32012b2c4fc66d1c6fab97e1a9234d70c523cd5c3a090')
sha256sums_aarch64=('cb1c8652a1a72c14dced97469f8827b4245c50bda35d08810575a12ea0d6d414')

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
