# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.18.2
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/5zH79JcqeK4/ngrok-v3-3.18.2-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/fpdD1Uje4gw/ngrok-v3-3.18.2-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/m2YHHs2jegw/ngrok-v3-3.18.2-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/66efuoMyt6G/ngrok-v3-3.18.2-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('67208fd1d5d26724ee7a15812cf259e265e4628fd5b8e00dcaab1e3383a10763')
sha256sums_x86_64=('1f47e6179f413927fbd9243a88f42f76812ba2f305a423bc4c623f4b027ebc87')
sha256sums_armv7h=('d8c5f0491bbeceabe8122307989025bdc4778219c49e58b7415ee44144e91f22')
sha256sums_aarch64=('829e979f8f516b6fd4eabef552e730b2f618c2024b355b0b2aec5aee12d4e7f4')

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
