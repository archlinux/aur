# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.23.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/a1feP9nHxKx/ngrok-v3-3.23.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/fWQZ2oD61Px/ngrok-v3-3.23.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/5zfwqGzWZSZ/ngrok-v3-3.23.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/8nHThnvrkhd/ngrok-v3-3.23.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('5c587b0729f71e20ac8b98b75dc4f213e1c60870e4707b247cbf8a9a8d2241bc')
sha256sums_x86_64=('ef2f304750aaf50151768ffed69489935b704133944b40ef6e35fe4f27f09690')
sha256sums_armv7h=('0a74aa79b77d27ffbc5d2a6f7e6c3948ff0d4ed41af31c6acd8cf6cf3bf0be79')
sha256sums_aarch64=('ca5fb4d417455ca4f3d42895a0391f4e38d3f08b8ae95b9530b8ce46229003d5')

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
