# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.14.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/crQGZKVE4u6/ngrok-v3-3.14.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/47LiRqFZSEm/ngrok-v3-3.14.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/8dfPnuhNurm/ngrok-v3-3.14.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/jSoSfgCTjyY/ngrok-v3-3.14.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('ce4c0c2ff334f3b3a03e521f95546fe7ebccd7f5f1a7a9f5f583129ee536f2d4')
sha256sums_x86_64=('9b0d4461afe9e050d2ae833c50896da91c2692a0dabed27017b3171fca6161f3')
sha256sums_armv7h=('e2628b7d57118b54aa0051d5eb3bed9f7ba7fca29f7a581e57ffaa22a63a5957')
sha256sums_aarch64=('459037e4356e1b70f0e60af966897f07de1af69e373aca247fde827ea335e56b')

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
