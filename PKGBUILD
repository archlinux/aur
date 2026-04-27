# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/4ekCMMwhpx9/ngrok-v3-3.39.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/njXy3EVupdm/ngrok-v3-3.39.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/3NcRtX1Z5j6/ngrok-v3-3.39.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/HBjQgXkoVJ/ngrok-v3-3.39.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('b6f3bfac0b9ab1eed2b20807958c062c7934f5c7aa8772a863f43924fbf9538a')
sha256sums_x86_64=('a388b8943f3059b19e2f51169af2816fa633cae43b13931688d0d4a0c6c64866')
sha256sums_armv7h=('534197d5cdefbf4b951d27bcd02cccffcacd13da0cc82a75e05a1f27302b88eb')
sha256sums_aarch64=('d1083513a79cf8f27e89b992b697b241922e7c1e26704efdb30d26d0966bae9a')

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
