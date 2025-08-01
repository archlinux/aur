# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.25.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/y6jRCax8G4/ngrok-v3-3.25.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/5ZdCbbLApVQ/ngrok-v3-3.25.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/g9SEQRWoYdu/ngrok-v3-3.25.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/b8CjBdDSkGf/ngrok-v3-3.25.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('3a39dcce4c521bf95bd80ad92ea80766721dbee0c04e22fd1d53a2e67a3ce795')
sha256sums_x86_64=('c9a87a050f0ec6d8a7a36a790630d0578690571085463c3924964c570465f772')
sha256sums_armv7h=('82a5c290a707ab531eb93ac6021c89833e7cb23d9b9284753026200235f83c9a')
sha256sums_aarch64=('8510a3d7e9ad58999e4199a48b8924228f0d791140c3caaba71ce8fd895d576f')

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
