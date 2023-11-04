# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.4.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/8U3NahKrMb7/ngrok-v3-3.4.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/3ndXunLZxr9/ngrok-v3-3.4.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/jcENzdnK9si/ngrok-v3-3.4.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/hmadqCe6Lnv/ngrok-v3-3.4.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('96b00658e46ce78226f426642999aec1c5593532ef975ada7b3a88550d5fd462')
sha256sums_x86_64=('f84e8e7b22ed5ee07f7256c5811ab154fcc6f4a75607af87fad214cf5d4cc850')
sha256sums_armv7h=('dc56d43e353dcea410f30593c858e0240c22c9db1a803e436f8f2540143f9c10')
sha256sums_aarch64=('203ac71b0af764438ad6b0fc27df71e2e8c10204eec88d670dc78f4b92dc9116')

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
