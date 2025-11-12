# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.33.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/m2HKeLr9d8y/ngrok-v3-3.33.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/hZJJyxQ3rz1/ngrok-v3-3.33.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/4ajHiraMwvX/ngrok-v3-3.33.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/3RHHaRTaETk/ngrok-v3-3.33.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('c6226cd0ec7e871de0dca2dd981af4708e3957e70be01698dfa75a0ccffaf415')
sha256sums_x86_64=('d4b67a33af9df9641484e1822855f77f572a1421ad6f1eeda9ff25b2b292abda')
sha256sums_armv7h=('e25ee2fed6d810adf731ecf3550c54bd62dc3b56a8878c6b77f61cf505ca4aef')
sha256sums_aarch64=('47eebbd07842559a31ca5e9366dbc147174c98bf68592ef1adf905007f834c88')

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
