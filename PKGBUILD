# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.4
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/rXi2K8HzgJ/ngrok-v3-3.39.4-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/kZmnJkBy94g/ngrok-v3-3.39.4-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/52nzXLngjee/ngrok-v3-3.39.4-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/iX6VpNRLBbs/ngrok-v3-3.39.4-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('27d64da36697fdc10ef221e5f396fd0c5d561c0af701b9b2c1512303b3e4f12b')
sha256sums_x86_64=('0efbc8c7aa02dec9cde9883b940ef0c69afce39305545d74cde2ff2e01170871')
sha256sums_armv7h=('4a92dd2847b1544aed1bdceff181f99bf555ac80b466f02c0f4142ad5a5084fe')
sha256sums_aarch64=('35446330929a79dc8bc755009cd54a29e2107781fec4f3c3f7f693bfe1ca64fe')

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
