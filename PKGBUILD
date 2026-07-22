# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.10
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/9sRAW6esxUB/ngrok-v3-3.39.10-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/yYu6hg4DiE/ngrok-v3-3.39.10-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/fPHdc3GnMU4/ngrok-v3-3.39.10-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/hqQ7mubGtHu/ngrok-v3-3.39.10-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('cff5b6e704090d9fccc9c43b44d6418ca8445eff2187433466a223adac81353a')
sha256sums_x86_64=('9dfbe1a914e69cc7e980d61e6bd5a642025918102c5bc69905d1c57703aca3e8')
sha256sums_armv7h=('a23e84d4706587740a5d590fa57fc42e289f2fd23c8694e9265a398890efb753')
sha256sums_aarch64=('7176f5e5d5a2f6c332ff911ef895741f13168f1f0c225492c4412bde8b2f9a0d')

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
