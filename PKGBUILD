# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.5.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/7qHLVJPrTcc/ngrok-v3-3.5.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/4gMs8FHXopG/ngrok-v3-3.5.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/ciuckTnS7RJ/ngrok-v3-3.5.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/iutMKiLdVzF/ngrok-v3-3.5.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('2ab242193e01222d1c5cbfe85389200b97fc3af91374bd4b9c8d86812db7d589')
sha256sums_x86_64=('bd44f722df4435daf61c4bef4fe45d8abdbbf5ccd6c371b6ab405a07fb469c06')
sha256sums_armv7h=('ba0ab1d956a0b05e35da6901691bd18166acc6a833c993e8f6b80f6d608e1d8c')
sha256sums_aarch64=('85b5ecc96a56a1d19324acb3ca3a38e11a9075be8cb97ee466a1538f8711a69d')

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
