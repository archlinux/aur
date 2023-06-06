# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.3.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/kLVLYuQeD47/ngrok-v3-3.3.1-linux-amd64")
source_i686=("https://bin.equinox.io/a/iwmcgCXcTew/ngrok-v3-3.3.1-linux-386")
source_armv7h=("https://bin.equinox.io/a/4A1qP6jDVZN/ngrok-v3-3.3.1-linux-arm")
source_aarch64=("https://bin.equinox.io/a/dJKFXmSfxPD/ngrok-v3-3.3.1-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('c8f9f53971de8acfe3ae3959aa8bcf7e625db2844aa7724f416df77fcc4f2abc')
sha256sums_x86_64=('e187ce91bf92a49b12f3f81480e3eec6ad9c7f76d3b1ec967e9ae4aec5927579')
sha256sums_armv7h=('a5aedf281419519c94d4d10fe7de44fbb45efbd712772172fa96e8eb9e2a4b5e')
sha256sums_aarch64=('94053faa5f4ef5946c7c87f9096c982e040e05232c60c1c514d86e3dd21af4d7')

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
