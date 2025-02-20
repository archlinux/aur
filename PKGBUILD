# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.20.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/e629VEbKnqD/ngrok-v3-3.20.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/5uG2QHnd28z/ngrok-v3-3.20.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/2NGnossrgaT/ngrok-v3-3.20.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/jXpwG7j9mxc/ngrok-v3-3.20.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('81daeb1c4d895e4de352c8d7995724298c54536422c854e7cf26abf833d8474d')
sha256sums_x86_64=('30055be48805088e017d264812bc437803ebee482a205d34201997a154798d56')
sha256sums_armv7h=('77f131a1b8c54e411c5f742cc27579903e3ae64080841bfe03890026b39fb3b4')
sha256sums_aarch64=('841cb8cd1ff3620e8a26ab1b8ac9731d1ed6f10ebbace9fce14b0c5135492d3c')

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
