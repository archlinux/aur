# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop
pkgver=3.0.0
pkgrel=1
pkgdesc="Zulip Desktop Client - Workplace chat that improves your productivity."
url="https://zulipchat.com"
arch=('x86_64')
license=('Apache')
source=("https://github.com/zulip/zulip-desktop/releases/download/v$pkgver/Zulip-$pkgver-linux-x64.zip")
sha256sums=('5267c3f232f12440556a7ca0f59b4c12537672e96882e33a512ccd2eeee83b3c')

prepare() {
  # Remove symlink to source archive
  rm -f "$(basename "${source[0]}")"
}

package() {
  # Install the whole archive in that folder
  install -dm755 "$pkgdir"/usr/lib/$pkgname
  mv * "$pkgdir"/usr/lib/$pkgname/

  # Symlink for ease of use
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/$pkgname/zulip "$pkgdir"/usr/bin/zulip
}
