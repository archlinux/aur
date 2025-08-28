# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.27.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/6YgqwrS9NV7/ngrok-v3-3.27.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/iFpvHN6dNsD/ngrok-v3-3.27.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/6BM33YjBUEJ/ngrok-v3-3.27.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/kjx7Nz7H7v9/ngrok-v3-3.27.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('5f2da906d63c7c413247ac70d82da023e8cbc8c245308ec789b5af3db3ec0b3c')
sha256sums_x86_64=('49c4b8ba03b840c17b4db8bcf9278ebe0c193395541841fd6a8f8be6112ab701')
sha256sums_armv7h=('52f0b5fe3d5a997bfd473f665d9faa226f378fa2f9e799ebb1b835c26f2534d9')
sha256sums_aarch64=('ee33cbe60e491cb175cd693b150b42ed0922c5cbdac989d862d744de99fbb844')

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
