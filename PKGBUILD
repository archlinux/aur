# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: kaptoxic <kaptoxic at yahoo dot com>
# Contributor: Matthew Avant <matthew dot avant at gmail dot com>
# Contributor: Rose Ames <rose at happyspork dot com>

pkgname=zulip-desktop-bin
pkgver=4.0.0
pkgrel=1
pkgdesc="Zulip Desktop Client - Workplace chat that improves your productivity."
url="https://zulipchat.com"
arch=(x86_64)
license=(Apache)
source=("https://github.com/zulip/zulip-desktop/releases/download/v$pkgver/Zulip-$pkgver-linux-x64.zip"
        zulip.desktop)
sha256sums=('c9c4f75871cf2fb88a22d68112e06300bb45bac75a06bf4d0af0ccfc530a756c'
            '4cf97c330c440c5f3d0cdc3bd9af9b22a0475dd462bbe336d591d52b5bb6236e')
provides=("zulip-desktop=$pkgver")
conflicts=(zulip-desktop)

prepare() {
  # Remove symlink to source archive
  rm -f "$(basename "${source[0]}")"
}

package() {
  install -Dm 644 zulip.desktop -t "$pkgdir"/usr/share/applications/
  rm zulip.desktop

  # Install the whole archive in that folder
  install -dm755 "$pkgdir"/usr/lib/zulip-desktop
  mv * "$pkgdir"/usr/lib/zulip-desktop/

  # Symlink for ease of use
  install -dm755 "$pkgdir"/usr/bin
  ln -s /usr/lib/zulip-desktop/zulip "$pkgdir"/usr/bin/zulip
}
