# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.23.2
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/74GB5NYiMhC/ngrok-v3-3.23.2-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/fQ1b7t1H9zD/ngrok-v3-3.23.2-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/kyFZZC1ERH7/ngrok-v3-3.23.2-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/4mSwTsMBkRS/ngrok-v3-3.23.2-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('f9745e0d5ee7c0a45fa2f69dfa6a1b006befbdff008d10adc106acbf1cf3bb9c')
sha256sums_x86_64=('b8fb53cc61bc84e3d506fc88fce8b2d3701640eaf64baebd101f373ae743e316')
sha256sums_armv7h=('0bfc1912d7a78ca2f4b6f3daf4b22c21b23231f0317148c0939270336ad23e0d')
sha256sums_aarch64=('482da9bdeeec728cfaa717f9783519962c06a86fa83351936c3a488aad9bddf7')

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
