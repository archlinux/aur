# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.14.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/34twwuTpXgn/ngrok-v3-3.14.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/fbCGTrHtahk/ngrok-v3-3.14.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/9gmWqhD4Sie/ngrok-v3-3.14.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/3Cz2CMTy1RX/ngrok-v3-3.14.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('9300f8daed5fb6f17d2350c1d4608193c5c83318dcca5e876f853c6163a1d21b')
sha256sums_x86_64=('7f350b0e2ab27e0be608c9c23cab78d6b2ab23df42c1b0c6bf62356227f37ced')
sha256sums_armv7h=('9d6fe1a24da45704562ecc1f8fc94134bc2c024593db448b9598d8af50205931')
sha256sums_aarch64=('bee3beb1591fb0d42ef4bced79e5325d62404c6e7244c5392328672dd219c625')

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
