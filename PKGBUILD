# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.13
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/h2cqbjsNLj7/ngrok-v3-3.39.13-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/9xC1dNA3u6H/ngrok-v3-3.39.13-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/8wmNQK9f5ah/ngrok-v3-3.39.13-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/j83dYTwHiq9/ngrok-v3-3.39.13-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('dac9a594acd0d642495b108d1eb065b53140311adbff284ae4afa33e4838214c')
sha256sums_x86_64=('233e0647849913e6404150c1e9c5e4f31c1368aefee330958d038d7afecb8f2e')
sha256sums_armv7h=('55d7127100d4eb211d6249a53c1f01bb353241e2be3ff0b97b304f2e9cf4d521')
sha256sums_aarch64=('fb41ee8f251969f6e399ef03122f791ae537155dfd9ac4c0baf108aca95c17d7')

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
