# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.11
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/5Mrhp7gRDVb/ngrok-v3-3.39.11-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/3erXiNs3rKK/ngrok-v3-3.39.11-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/8ofUdPNoYoQ/ngrok-v3-3.39.11-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/dg26hrkwY2F/ngrok-v3-3.39.11-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('ade0d9fc069b990d0103bb87600d69931d85cb13bb68d94a4dfcb6b8ad54d714')
sha256sums_x86_64=('cec0b4997fcc5f529dfc74bac89050354d11a915f968720600039738fdf330cf')
sha256sums_armv7h=('3ace51ed57d18eb8d35404729121654eaa19ae1a7fd2c371eb991cac11c0eadb')
sha256sums_aarch64=('3b6ba05a9d9585c34157fa0819fa95cdb13839f5b506b9e63204705cf7f79e29')

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
