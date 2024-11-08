# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.18.3
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/S37RP177wV/ngrok-v3-3.18.3-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/e63xFkuaiC8/ngrok-v3-3.18.3-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/7Y8965n9Ear/ngrok-v3-3.18.3-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/hw7g1M9CRhE/ngrok-v3-3.18.3-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('36e380cecda652cdab56a783d387ace925417af2fd92ca274e29770d7f835a97')
sha256sums_x86_64=('03084459b203150870d0aba944d7c752312c3a8a369687d4b7e3dd59d9a3a6d6')
sha256sums_armv7h=('8b432c6595a1465ece73c080d4683c0f5f4003033e2953f605c9c1f880e96dc3')
sha256sums_aarch64=('49f9cae885a08037a69c29eb3586bc1a1e77da988c4ac106512c6bdfc9025468')

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
