# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.18.4
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/mLEsSQ3GVjR/ngrok-v3-3.18.4-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/gmyiZpErTTR/ngrok-v3-3.18.4-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/eAUgtU9k6sy/ngrok-v3-3.18.4-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/mgeswtLSdGm/ngrok-v3-3.18.4-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('07bfde3fa3673019883a2ec63d7d74d804c289bd0b219d2c9db74e314608ff7d')
sha256sums_x86_64=('dc6fa1a2e987efd0b31f5f8f55e8334a8821eb1145b3994ea4814f10d54c69ca')
sha256sums_armv7h=('479177676ee9adad3da16e86a6802525ab6dfec79e748b85b9556dcbf87055bf')
sha256sums_aarch64=('3b8c3d5a5b719c3470ef357ebc52522fbf4c920bda9088c22deaabb121062d13')

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
