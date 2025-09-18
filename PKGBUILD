# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.29.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/eKRpgFT2bq4/ngrok-v3-3.29.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/8PGBpRV6NEP/ngrok-v3-3.29.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/9ULu9UrTwmG/ngrok-v3-3.29.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/xsGxfE6uYJ/ngrok-v3-3.29.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('ad8eaa4f24de2225d19216520eee4cf039da95061241a23770ef9f9de4f5ed72')
sha256sums_x86_64=('d7c267f45585da881f9aaa4e0151068603cb3f29beea88d8ba48b003b36b00f3')
sha256sums_armv7h=('c53f0fd507a56ecf3a51f95b29f2e0cddcca5a1a45669fe7a53fb2e488961213')
sha256sums_aarch64=('a9321c90b373efdb40acf2998f3fead6d787ea6cd997f1ad6a47b8ad12f511c4')

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
