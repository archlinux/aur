# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.22.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/jVjTX7dAozH/ngrok-v3-3.22.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/cDgo2tYnSZe/ngrok-v3-3.22.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/aKXfcMetQkf/ngrok-v3-3.22.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/nb3XZsbkEhX/ngrok-v3-3.22.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('5bc8e0d27bf480c0f4329653b19ef7d97e56fea780956dcf25fc559666dcfd69')
sha256sums_x86_64=('fd18d6d5da27761f33eec8137efc0fdae64eb8cfc6ca79e042d4febde430638a')
sha256sums_armv7h=('97cc1ed792dc159471ebe0b11afe54f2ca51112c766c1326650206dd52331365')
sha256sums_aarch64=('c0a4ffd152bf6f7ccd58722e07ece0227225a85f285ea231d5fe8013ab3ee587')

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
