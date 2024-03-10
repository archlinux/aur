# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.7.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/doBjqyzrcYM/ngrok-v3-3.7.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/NYbWaAdCby/ngrok-v3-3.7.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/hgUUy2bUaz9/ngrok-v3-3.7.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/9p821sdaKqh/ngrok-v3-3.7.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('3fbf2296a8ce35c7d050ed4c828ef4eacc8724852faaaaa8054822ee72426606')
sha256sums_x86_64=('d1f7149079bb3bce0a70619580818a0ec09ac20da25f64a268203c2a3a019a47')
sha256sums_armv7h=('5f2f0bf4ae42f5c8dcb945694bd1aedf963d631c39ba0cb9c0b9626eb396b2c4')
sha256sums_aarch64=('f43af93d9d7a9af22a2a5423a0b7b964790b1d2dccfd532142a807282360c21a')

# In order to make Ngrok's built-in updater happy, we need to avoid modifying the binary
options=(!strip)

package() {
  BASH_COMPLETION_DIR="$pkgdir/usr/share/bash-completion/completions"
  ZSH_COMPLETION_DIR="$pkgdir/usr/share/zsh/site-functions"

  # Copy terms of service to license directory
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" TERMS-OF-SERVICE.txt

  cd "${srcdir}"

  # Install the program.
  install -Dm755 ngrok-v3-${pkgver}-linux-* "${pkgdir}/usr/bin/ngrok"

  # Generate completion for bash and zsh
  mkdir -p "$BASH_COMPLETION_DIR" "$ZSH_COMPLETION_DIR"
  SHELL=/usr/bin/bash ${pkgdir}/usr/bin/ngrok completion > "$BASH_COMPLETION_DIR/ngrok"
  SHELL=/usr/bin/zsh ${pkgdir}/usr/bin/ngrok completion  > "$ZSH_COMPLETION_DIR/_ngrok"
}

# vim: ft=sh ts=2 sw=2 et
