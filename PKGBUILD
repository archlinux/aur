# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.25.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/eST5pGVCpfn/ngrok-v3-3.25.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/kDsfijXBP5N/ngrok-v3-3.25.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/hA9f1AdNHVE/ngrok-v3-3.25.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/8BJ8QUingPB/ngrok-v3-3.25.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('fef7cfd335bac6de69dbf84439191a0cbe361e06870efcdf3ef4ebd54ad535a9')
sha256sums_x86_64=('f6e1539493b7ae86f5dd73f0b657beed7a148ab86366378d2164c42db58ddf65')
sha256sums_armv7h=('66c68eb5ee7da4fbc2bef3b2a98bc201edd29d8d1ce846c21c7888815183e766')
sha256sums_aarch64=('323e555c2de8407f5a94f41649fe1ecddd44343ea28b9cf8668f8cddff265977')

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
