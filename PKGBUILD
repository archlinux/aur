# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.30.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/55j9WmGWhFi/ngrok-v3-3.30.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/e2Xeom4j8Eu/ngrok-v3-3.30.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/mda7d7TJcGj/ngrok-v3-3.30.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/8t9BYVDG9wj/ngrok-v3-3.30.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('0b2c0ae0221816899302a561fbd142b1bf2cde695dfc7337ff85ca33e5f39aed')
sha256sums_x86_64=('1736116bc8b4b4f4d9de3109521b56f3e44cadbe7047bb5be53a2d2e939fbcc3')
sha256sums_armv7h=('9653eda14220ed28bf9775f96b555d0a1ce77661088969867b20913c2918b011')
sha256sums_aarch64=('906661e9ff937f99606ab3c5941b19e51aaa5dbad6f93d1b4ca8bb91281eb898')

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
