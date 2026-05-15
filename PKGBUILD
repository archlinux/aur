# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.2
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/jtYuXgskn3j/ngrok-v3-3.39.2-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/mD1diXHwsKv/ngrok-v3-3.39.2-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/iVfpsJX5fo8/ngrok-v3-3.39.2-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/3G9xgjx6bMH/ngrok-v3-3.39.2-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('4779686feb62b86f2f197ead13e71a8a29d7d7f75a1a3b1d4a731271d157342c')
sha256sums_x86_64=('e3f776cab602f95d139e12d9486820faf92269a902f3825f7180f69ba8ff8b98')
sha256sums_armv7h=('d362a1449ae80f5a3925526222581f788db89445424549761b4cfb643d7a835d')
sha256sums_aarch64=('170eaa3cb8fcdfbeee768d77f57e27f631b1b01bcfda271b0f0e591e7487b76b')

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
