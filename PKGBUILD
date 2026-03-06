# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.37.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/HFjZ5MmH2o/ngrok-v3-3.37.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/gKGeDv7stS3/ngrok-v3-3.37.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/KbWXGK9RaV/ngrok-v3-3.37.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/bTqdvhgsxc8/ngrok-v3-3.37.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('42e4a0ce193305a390776463d4f501beac62f6f281ece645ecdc82bdea38bb4e')
sha256sums_x86_64=('26fe9923febe318d0d73e58f67acf0b29dbe5bff191a5d0f5e576afae6ac3884')
sha256sums_armv7h=('2d28d8157b6d5bf6b788a98120668db9e59c43439482a6684c91f0a04f496b27')
sha256sums_aarch64=('1d6b6fd4aed50e9dce5a3d4ea65f9e2a52a68d01ca621276168f8f2e998ffbca')

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
