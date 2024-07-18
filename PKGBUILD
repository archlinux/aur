# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.13.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/4no1PS1PoRF/ngrok-v3-3.13.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/2HQZn8ig8a5/ngrok-v3-3.13.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/mDqRXc8xBYG/ngrok-v3-3.13.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/hjjwJu9oVYX/ngrok-v3-3.13.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('ca527b484bb1adb224bc1a492f6d3dd4195dd65854bdad30c13ad8350234babe')
sha256sums_x86_64=('413446ec9964219e0e7c45bdbb2dadc1c6e0b4fec4dc45e2207c9df75cbe2143')
sha256sums_armv7h=('d7d7f5e3047efdd58c350164da300be9558b9edbde8f1e2cef4e1dcfec3adb1b')
sha256sums_aarch64=('0a37c0912aca7f5e0bea4215cdfca4249557e6a3886e86fdffa2299afb0853da')

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
