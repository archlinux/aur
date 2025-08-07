# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.26.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/eVTvzGP2KLj/ngrok-v3-3.26.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/nnUVPPmbn7Q/ngrok-v3-3.26.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/hHrXJrsTec6/ngrok-v3-3.26.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/2MhEizvCU8b/ngrok-v3-3.26.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('a996d1ecba004440ba53917c8468384e7b2b11f231772fe7d7bfc550b151c6a2')
sha256sums_x86_64=('21c6d25f78ee768d894ac4c8022f96a3f4a9573c52afcd8714452856353403b6')
sha256sums_armv7h=('91a56766b889ef7641aff5d791a6d3e75611e2f8cdfb7a48c9cd6885793a44da')
sha256sums_aarch64=('54821ca05cdf4a8c44db0aca9f83f72fa2b138377e858990ab75f67494254e5c')

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
