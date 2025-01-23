# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.19.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/9VU6NY9RyvK/ngrok-v3-3.19.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/4eJDfJEie7Q/ngrok-v3-3.19.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/5CmgMemZgKf/ngrok-v3-3.19.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/2TnbkQvg2gK/ngrok-v3-3.19.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('3239882002be7959f2516e3d13f96d5d2f0fe4b5b705d9793d9a3cb54c7ab105')
sha256sums_x86_64=('3aa738971d3168b31865031072d2dea49c403f93c6a7adf9d49ba312918daa0a')
sha256sums_armv7h=('af196a4e6fe48350821b14c732a92d5f0666678eec0cc126fb1177ded103b921')
sha256sums_aarch64=('4412dbd12d0da3d2856d3dffacdd89ba9b73d13ed6618e0bdf7706a66fbb39f0')

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
