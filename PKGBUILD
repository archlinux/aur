# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.22.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/ifokTextN5q/ngrok-v3-3.22.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/9QAqisJQrWM/ngrok-v3-3.22.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/hzbrfap84SW/ngrok-v3-3.22.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/mtumuCugr4n/ngrok-v3-3.22.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('60441ffea5192ba962709494aeb3ec7b79046273a1bba928f49c9ae9b079aa01')
sha256sums_x86_64=('73cd52eaf48f5cc751faf7ffb8585a1b56e54ff1c6a7d2f0908a9414a16abbd2')
sha256sums_armv7h=('fa659a135da7b513c80602b2aa9c6fcdbc668fde98fce3e95c76850b6291d138')
sha256sums_aarch64=('bb6eb24c6036d2b4f9a4e3b11bf434885e516808e15a32d2484a2ec2e1f2c44d')

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
