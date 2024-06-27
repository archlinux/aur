# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.12.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/jH2ToWm5g3b/ngrok-v3-3.12.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/c5tXAaUtunf/ngrok-v3-3.12.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/bohZ3tG2XPE/ngrok-v3-3.12.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/bceBRKqekcX/ngrok-v3-3.12.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('fd6e49482743e653b4b617418434cf00d668e234d888701d17458e71d7e8721f')
sha256sums_x86_64=('d6ebcfd61f46b9df43878fde55bcd0c5b3f556f2d2456d7af56b995726039b56')
sha256sums_armv7h=('6742cdc484c9ab3a8aeccf06dff402d848eab710475506c3575190945f1f0e6d')
sha256sums_aarch64=('038fd94b4b1797430588c47fd986de3aee7dd98ef9dcdd5ea8a4784ed5703b66')

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
