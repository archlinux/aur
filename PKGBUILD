# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.32.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/3tRpkkFCXS4/ngrok-v3-3.32.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/kMHcxNBWLjS/ngrok-v3-3.32.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/e3vd4xoSwpD/ngrok-v3-3.32.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/xLaBieGnuN/ngrok-v3-3.32.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('b5855dedc0ab42d5ba4f530c1dcd99e71d25713dc544f76b82ab6910acd09f49')
sha256sums_x86_64=('048c4a9c7eb8b330a472f022487fe4ed1a572a2c8dab037cba3ac7b7ccd21db9')
sha256sums_armv7h=('ec0eef5a16330b532ac4d9d4f821f07b73a3428113b930cff22f2df6321e1efe')
sha256sums_aarch64=('f59d63ef7a75c366199f83c52856c9c2ad407bf0ddca37d6881b3d819233df10')

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
