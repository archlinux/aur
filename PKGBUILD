# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.10.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/81d5kzodW8G/ngrok-v3-3.10.1-linux-amd64")
source_i686=("https://bin.equinox.io/a/9uULeng4k9u/ngrok-v3-3.10.1-linux-386")
source_armv7h=("https://bin.equinox.io/a/8iFd8QPGgx1/ngrok-v3-3.10.1-linux-arm")
source_aarch64=("https://bin.equinox.io/a/c2kv1gi2bti/ngrok-v3-3.10.1-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('806700e4c1aa5d6cb10d2ef1ed8079a2e2e8e6d1198f313b0df389589356fcf7')
sha256sums_x86_64=('d23ed659469e6f58ed0c34bdbc9846744df908c960f1b1e576cf147345f5e833')
sha256sums_armv7h=('36dd1a3893552218f21e118902ae3dabbc43a7f2de1d78937e304893d970377b')
sha256sums_aarch64=('86ecd3f4e43c1631a8332a9ee7d629073a7d7bf7412d2d60e1f390f7b2d30bc1')

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
