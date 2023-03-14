# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.2.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/iXjh6txJCWy/ngrok-v3-3.2.1-linux-amd64")
source_i686=("https://bin.equinox.io/a/hcs69SDYhiQ/ngrok-v3-3.2.1-linux-386")
source_armv7h=("https://bin.equinox.io/a/kdRY9AiwBRP/ngrok-v3-3.2.1-linux-arm")
source_aarch64=("https://bin.equinox.io/a/5e8stSEtVCw/ngrok-v3-3.2.1-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('8e6947dac8f7781695276db64d3952189ab7ebd76e1558a4c0d168df5f683a96')
sha256sums_x86_64=('10877500a4cc12c6f15acdd4034c517ecc452792bee42216df58e376cad05df5')
sha256sums_armv7h=('4530c4f6b861737d598c83ff25429908d18f262afd1f34b87aa2c9098f9bb513')
sha256sums_aarch64=('ab96bff1b897d851738dbf278fd3b9f6f1c28ce7bd52eba2529cdb26ee879889')

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
