# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.21.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/3egBTNd3FM1/ngrok-v3-3.21.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/dSpKgHZVRJK/ngrok-v3-3.21.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/2VjTiwffw7n/ngrok-v3-3.21.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/rLCxeBrpuY/ngrok-v3-3.21.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('560808b783727311d26699e37dd0bb350db36f464bc6ee94d17ad5622616ca26')
sha256sums_x86_64=('ceaddf9549d228891ecd20dda25f668b65f1852157df557773a8517d2e61deef')
sha256sums_armv7h=('5c068819bf6afc062029dbf8218e2e89be3fc4ac61828822361aa7390bd19a11')
sha256sums_aarch64=('06da912b14072c1e6fc3606db1b7416daf521ec16149e27e19eaa3246b71cc30')

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
