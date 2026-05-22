# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.3
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/i9e7vesq5nk/ngrok-v3-3.39.3-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/4vZZMEuh8hG/ngrok-v3-3.39.3-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/f1VYUsqrGYz/ngrok-v3-3.39.3-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/aCvwJgiCdTz/ngrok-v3-3.39.3-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('2530dbf01ce47415c76ed3e62bf1b42b640da14a8df1332e5cfd8322b6c76e78')
sha256sums_x86_64=('6eb4cef006176f390d0f016be61aa1de8e4cd154928c30f7c94a380eb8fe86dc')
sha256sums_armv7h=('c7aadd98e71febb4b86af1285b5678e15364e7017b097417cac0839bfa0e0728')
sha256sums_aarch64=('266bb4e4d452f6e6d7a2e678dd4683880f5bcfbaf9794a2e1e4a53216f52c1d8')

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
