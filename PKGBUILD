# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.3.3
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/f7PaJzSXoA2/ngrok-v3-3.3.3-linux-amd64")
source_i686=("https://bin.equinox.io/a/7pv5RjaMpU1/ngrok-v3-3.3.3-linux-386")
source_armv7h=("https://bin.equinox.io/a/frsv4Yrm6XA/ngrok-v3-3.3.3-linux-arm")
source_aarch64=("https://bin.equinox.io/a/542kTdgMzGh/ngrok-v3-3.3.3-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('002f00f437cbc365fd52bed26845adde4c2a0ba6d5261afe41cbfd5351aab7a1')
sha256sums_x86_64=('fad53fdfa85c0724321e18a0374cee76ca0843ae8b5f07519d76d7c7dafce3b9')
sha256sums_armv7h=('8f2925b48fbc4a1a1647e07c58f986918aacdfcd288d20de4764e858039c8309')
sha256sums_aarch64=('23abbf5ad12686e60f2fe02ff6b2c670f10feb5a25fc38c13634d71743aea900')

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
