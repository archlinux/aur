# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.12
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/rG6QSVno1F/ngrok-v3-3.39.12-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/eVGus2j8dTf/ngrok-v3-3.39.12-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/gVcEdAfwaka/ngrok-v3-3.39.12-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/mZKpd326i7W/ngrok-v3-3.39.12-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('246619ebc52e7acb2232ac04a120642dc00889af97886a76735c902c30b63252')
sha256sums_x86_64=('01f79749bc75273a0c634c59eec4e6235c3ab7266d5bc6a02cbac6c7fe6472b0')
sha256sums_armv7h=('7c8ac825d31da1005d634f9130fd7512a2f4ab2d13b63eee0ed12dc6a16e727d')
sha256sums_aarch64=('98adbac487844e00223b23c96f6831dd3f6210b2b046b78e78a7bd34bc0ac734')

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
