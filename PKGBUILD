# Maintainer: puddings233 <puddings233 at outlook dot com>
#
_build_hash='g5609110-164'
_beta_ver='beta1-1'
pkgname='hachimi-world-bin'
pkgver='1.0.5'
pkgrel=1
pkgdesc='A community-driven open-source meme culture music community, bin version.'
arch=('x86_64')
depends=('hicolor-icon-theme')
url='https://hachimi.world/'
license=('AGPL-3.0')
source=("https://storage.hachimi.world/distribution/linux/hachimi-world-${pkgver}-${_beta_ver}-${_build_hash}.deb")
sha256sums=('5f5afb422c9f0b33bc683fb88dcf31ea82e0da1d54cf6486353e8d3b738ff382')

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
