# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.11.0
pkgrel=2
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/3MFEZKVpGkg/ngrok-v3-3.11.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/85jup5DKATu/ngrok-v3-3.11.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/3MypJXrphpd/ngrok-v3-3.11.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/g7hNJHCT9q8/ngrok-v3-3.11.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('d2d9d0240fb20b5ab2d33fc87f71d312bff4fc568034c38be239713f9f514fcc')
sha256sums_x86_64=('fd9deb93e4b4ba66847f577bb54a2d965cfd885681df62fd534713b3bfc5252b')
sha256sums_armv7h=('779713078edc60bcc5fdc1e5acd9df4203c7ba122033fa06ad1907cf3babe350')
sha256sums_aarch64=('3ff27e01e05961aaeaf1cc28db9738b0669108079389762669c8462e01c96e6c')

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
