# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.37.3
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/jktiuEackke/ngrok-v3-3.37.3-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/efpzd5zzn3X/ngrok-v3-3.37.3-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/8JCsqxsXXpm/ngrok-v3-3.37.3-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/kySNYda51BX/ngrok-v3-3.37.3-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('145b47333a026137ad4b5d45e51adf88d6d1c8bf54c009db0bbe66c5670fb03b')
sha256sums_x86_64=('f71dbf064ced257f9873cd5f6f1a92cb7f9690b890260ce8a5cf4e7600e932d0')
sha256sums_armv7h=('de2dc57a18323a1c6b56566729428499ea24076380f518c061ff9d5ee69d7396')
sha256sums_aarch64=('17a06e4f1280b395c12ef56e602da75a1d7a7c7ddc21f9fd26e2046cad62c1ca')

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
