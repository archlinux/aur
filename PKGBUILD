# Maintainer: puddings233 <puddings233 at outlook dot com>
#
_build_hash='ga1e9bc3-175'
pkgname='hachimi-world-bin'
pkgver='1.3.0'
pkgrel=4
pkgdesc='A community-driven open-source meme culture music community, bin version.'
arch=('x86_64')
depends=('hicolor-icon-theme')
url='https://hachimi.world/'
license=('AGPL-3.0')
source=("https://storage.hachimi.world/distribution/linux/hachimi-world-${pkgver}-${pkgrel}-${_build_hash}.deb")
sha256sums=('64c9a4f4444b7d2608b4a02029c6aadbcc41da15313e42843ebacacc84fc64a5')

prepare() {
  cd "$srcdir"
  bsdtar -xf data.tar.zst
}

package() {
  cd "${srcdir}/opt/hachimi-world"

  # opt dir
  install -dm 755 "${pkgdir}/opt/hachimi-world"
  cp -a bin lib \
    "${pkgdir}/opt/hachimi-world"

  # bin link
  install -dm 755 "${pkgdir}/usr/bin"
  ln -sf "/opt/hachimi-world/bin/Hachimi World" "${pkgdir}/usr/bin/Hachimi_World"

  # desktop dir
  install -dm 755 "${pkgdir}/usr/share/applications"
  install -dm 755 "${pkgdir}/usr/share/icons/hicolor/512x512/apps"
  install -Dm0644 "lib/hachimi-world-Hachimi_World.desktop" "${pkgdir}/usr/share/applications/hachimi-world.desktop"
  install -Dm0644 "lib/Hachimi_World.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/hachimi-world.png"
}

# vim: ts=2 sw=2 et:
