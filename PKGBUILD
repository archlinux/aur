# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.3.5
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/5XRpKEttM6d/ngrok-v3-3.3.5-linux-amd64")
source_i686=("https://bin.equinox.io/a/fUJeXRL9niB/ngrok-v3-3.3.5-linux-386")
source_armv7h=("https://bin.equinox.io/a/d7UVf4Cj1iG/ngrok-v3-3.3.5-linux-arm")
source_aarch64=("https://bin.equinox.io/a/4z6ZXan5VAx/ngrok-v3-3.3.5-linux-arm64")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('b122baff50b08bc22458803ffad720f4b15251344991eb236658f2a248649bb4')
sha256sums_x86_64=('3e4b43384806c5793bba68f3d338e4fd253f671ff9acbe69938362d266e8bbc0')
sha256sums_armv7h=('818d15c5ffd74d078eae1ded94a04ddea3870139801ddf003f7079c65b57e13e')
sha256sums_aarch64=('5c4e75c2b8c874b4f79a3c2427fdfb21a1b3b285a30934c59adb0180e3f67d35')

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
