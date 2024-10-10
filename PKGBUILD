# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.17.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/2gKcMxAFGuv/ngrok-v3-3.17.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/3cANvu7v7Jm/ngrok-v3-3.17.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/69q6QCEPV2g/ngrok-v3-3.17.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/aGACSdDMcAg/ngrok-v3-3.17.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('53079bf25d48195f334cb920b8045d89ee14d1c031c207d77a3ca9f53fc1f66a')
sha256sums_x86_64=('ed7b8fce561a534b2e13eb80f0858be0f1e48e2f9ee285ce43d4047610e97c60')
sha256sums_armv7h=('e7818b8631dbe727c52899faa637dcbf2a2adcfe571420f9379cb24a09edf946')
sha256sums_aarch64=('2c463e635fbe5997e0717b93d83793d6c38eb2ef06f80c0f60f25b4a6e1a775e')

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
