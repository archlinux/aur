# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.34.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/3TeSQTxP1cW/ngrok-v3-3.34.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/izXLKmeMspZ/ngrok-v3-3.34.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/c6FcDJYdmx9/ngrok-v3-3.34.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/keHpHAW8Nen/ngrok-v3-3.34.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('8f7311a45f655a78c0b011b48f211df7743cd20fca107f054390c792f37239a5')
sha256sums_x86_64=('12574f6361c8897af5c22a742e39243aaf083d1a213f48a0ddd763fd5adf7cfd')
sha256sums_armv7h=('ba6517335eceb00978b5357ba50d037c23d19a13825cc11b2bf980d56bdf7c15')
sha256sums_aarch64=('fa437ef614e1c87b87e78419e8acdb50466fc47996917fb5591bf7832891383a')

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
