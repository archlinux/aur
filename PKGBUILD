# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.15.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/4yTjqzQQWUF/ngrok-v3-3.15.0-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/cPAeN7i3sr1/ngrok-v3-3.15.0-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/f4CCxUFFwDd/ngrok-v3-3.15.0-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/mmpFWXRDhn4/ngrok-v3-3.15.0-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('cc44352004f2fb3625192d3d87b049f4cd875f841cf5600c230f775f9eaa1d8b')
sha256sums_x86_64=('565b70eabcf2ad15368f556f86f373381327ee60cd4c31bc760d0dc3960cd05c')
sha256sums_armv7h=('1f1a13bfb9f49f693f8b4103bca77f300b0e2681d36e558085918d6a8117d526')
sha256sums_aarch64=('181fe1b0cc101367460e3d2fdcb82f1a5cb1d45a974db9e8fced2f4c2f80c7b8')

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
