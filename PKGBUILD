# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.6.0
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/e6rvYmQb6MC/ngrok-v3-3.6.0-linux-amd64")
source_i686=("https://bin.equinox.io/a/5FUi7gCzPvi/ngrok-v3-3.6.0-linux-386")
source_armv7h=("https://bin.equinox.io/a/iTLH8EwDQN2/ngrok-v3-3.6.0-linux-arm")
source_aarch64=("https://bin.equinox.io/a/ibBBjsbrZAm/ngrok-v3-3.6.0-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('2036fc58594c7205aebaa09e9665d5c706391746122a417e57fa9a1bce62a727')
sha256sums_x86_64=('14e6118f1021b5b8421945a13b15ec501bc88aef0089b1dbf31d1fb229115d9e')
sha256sums_armv7h=('0bbc395cc610c0017d12a812496856677f6a653f60a76203d0f031914e4cf7bc')
sha256sums_aarch64=('39575a951352e571f6f96fd4409cbaa675dc4593786c9f198c2fb45360361f02')

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
