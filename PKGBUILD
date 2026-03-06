# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.37.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/h1xbUKBWPeY/ngrok-v3-3.37.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/f8HdFmd4TkS/ngrok-v3-3.37.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/cHKzfAYdgqS/ngrok-v3-3.37.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/kqTVEZgQABa/ngrok-v3-3.37.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('bddd25d008f1051f6f2be26fd6303428f1c4c211a1d493f9d90e7cdeb1aadf00')
sha256sums_x86_64=('c3ff80c7693a56dba6ca4dfa801353f3dfd42e1689fb9cae7202b489e559d2b5')
sha256sums_armv7h=('7e1c1b1fb91ffd795bd4cf1f1d4ac4cbd32a658757f9d6702bc294a34220e6f6')
sha256sums_aarch64=('6682d3cc45a3ebcae579d00103eb0f9416d7e4796285de43f3775edb08452a65')

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
