# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.34.1
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/bBYEdiLV5M5/ngrok-v3-3.34.1-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/6e3LZpuWwCX/ngrok-v3-3.34.1-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/jagmTLBGLEq/ngrok-v3-3.34.1-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/bh3Snix5V6e/ngrok-v3-3.34.1-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('f7774a65aa069a63d68f0b8793c1e7aea6a4984a43de337b14f3f23fd27caf3f')
sha256sums_x86_64=('8cbaf02b3f9b3c118acf5bd3075b2668151031c158cb458b79a68c3b14ed34e8')
sha256sums_armv7h=('e2627181a8ea4342bc6cb881e77decc1ddeeec7dc432d5f87c50ca0d94a0e956')
sha256sums_aarch64=('10509202894c6e005bc62a3fb4fcee19addeac57cd490a33d3af7c847b5dd0d8')

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
