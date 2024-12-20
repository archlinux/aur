# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.19.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/2dgTMJmT3uY/ngrok-v3-3.19.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/bWeNyp94Pon/ngrok-v3-3.19.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/6wujdKYbbDG/ngrok-v3-3.19.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/ig9xfzK35LF/ngrok-v3-3.19.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('5c40709516b55cd5b1eed7a673747fd474c1b11cab932f0cb62ee9763c5d718e')
sha256sums_x86_64=('6bb21618b1ac9ed7c16dc5189a5a4421dc87c5bbf18917ce0dc2cd0a7841aeec')
sha256sums_armv7h=('432279bfafdb8fbc6de6e3c603021d4bee25ed3e85d1d56e74e85cea90c48a04')
sha256sums_aarch64=('6331b0df29cf0179fe4cb254ef8ca1d4ba01cbcb230cc16b410b314c31ec89cb')

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
