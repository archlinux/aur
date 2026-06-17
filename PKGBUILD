# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.8
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/i1xwx4wFPwR/ngrok-v3-3.39.8-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/hr32uahCStc/ngrok-v3-3.39.8-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/koBqopACAvd/ngrok-v3-3.39.8-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/57FxLiYxj7d/ngrok-v3-3.39.8-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('9b6d17ee128dc76f66a22624c9ab6d097f8c087b4e90bd6b8583410e2d531e7c')
sha256sums_x86_64=('e5d3121eb78b97a20ec2def17a9d71d57405db1b0a14fa2125237848c072436c')
sha256sums_armv7h=('f1a957d9c845a01e1d1996c129bd85857f2f862265f84ee86537c86bc25d1c87')
sha256sums_aarch64=('349ebfbe200a04c3e1265146cd15c887b72ce3463b8381d10accb7af8baea0fc')

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
