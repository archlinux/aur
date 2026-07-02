# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>
# Contributor: Daurnimator <daurnimator@archlinux.org>
# Contributor: Bjorn Neergaard (neersighted) <bjorn@neersighted.com>
# Contributor: Peter Sutton (foxxy) <foxxy@foxdogstudios.com>

pkgname=ngrok
pkgver=3.39.9
pkgrel=1
pkgdesc='A tunneling, reverse proxy for developing and understanding networked, HTTP services'
url='https://ngrok.com'
license=('LicenseRef-custom')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
optdepends=('bash-completion: Bash completion support')
source=("TERMS-OF-SERVICE.txt")
source_x86_64=("https://bin.equinox.io/a/5nBQH3CiRsa/ngrok-v3-3.39.9-linux-amd64.tar.gz")
source_i686=("https://bin.equinox.io/a/jEtFg4yox4u/ngrok-v3-3.39.9-linux-386.tar.gz")
source_armv7h=("https://bin.equinox.io/a/6z2GognC1cY/ngrok-v3-3.39.9-linux-arm.tar.gz")
source_aarch64=("https://bin.equinox.io/a/bd5z9PXqhwe/ngrok-v3-3.39.9-linux-arm64.tar.gz")
sha256sums=('d1fce3c7e78d5f7e5307238ee5f371b7a10911aeb249e3358e945eaa8cf2f1b2')
sha256sums_i686=('9daf4b21dd2b9743949992706c1ef44457b1dfd44542f182a2c55ea59115c52b')
sha256sums_x86_64=('0b74db428f655944292cf6c554d35c8941faeccff87d5a6835152c7a08281ff0')
sha256sums_armv7h=('b0f9e39668406d361d44a242546ebba4144256ff3c320032205379c18a1ead83')
sha256sums_aarch64=('97fb70d88c83ee44d9655b67e877702a1fc0e75656d33d414043772cd3750c1f')

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
