# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.31.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/eEr2iRZbSoi/ngrok-v3-3.31.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/jRbJhAh3p7t/ngrok-v3-3.31.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/9Tjv7ZYZNJa/ngrok-v3-3.31.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/aiEjwpaqPwU/ngrok-v3-3.31.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('f0aea6629ebd1112264e90370b6563e733245c5fe3066ae2b75ecdad872547a2')
sha256sums_x86_64=('b794efbb5e75a056a6dc0ec7f5d61f4283f9d5dc1011907db2551c9bf77b6e76')
sha256sums_armv7h=('2ea9325766e206bbace4fc0c6462b3cadfe05bd504d9f2b92d15569b6ddcf06f')
sha256sums_aarch64=('ebb1d5ee932fdc79beee51d6398985481e38a45f58b44bc462a97a24ea0fb905')

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
