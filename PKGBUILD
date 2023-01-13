# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.1.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/dqrwdoEvP2Q/ngrok-v3-3.1.1-linux-amd64")
source_i686=("https://bin.equinox.io/a/64nFcrEHYrW/ngrok-v3-3.1.1-linux-386")
source_armv7h=("https://bin.equinox.io/a/biK8Eisfsar/ngrok-v3-3.1.1-linux-arm")
source_aarch64=("https://bin.equinox.io/a/d45uz1Sks8d/ngrok-v3-3.1.1-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('ab7aa2adfa5e29da618142878e1aec93cc55ea5c8f7e69c2582baaad2e149b64')
sha256sums_x86_64=('9e6575f21e71b0b89b775bf66aecac68535573965391b48bfe488e18b1796b9a')
sha256sums_armv7h=('fe5c1e3918b8973397ec70a6a46d2c70c784720dc95add6e7059ed501bf498bd')
sha256sums_aarch64=('bf1ba6948bb20d31427eb453504d7fb1bfe447c25665172b8b6b4547c5b65f0f')

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
