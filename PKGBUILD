# Maintainer: puddings233 <puddings233 at outlook dot com>
#
_build_rel='235'
pkgname='hachimi-world-bin'
pkgver='1.8.0'
pkgrel=1
pkgdesc='A community-driven open-source meme culture music community, bin version.'
arch=('x86_64')
depends=('hicolor-icon-theme')
url='https://hachimi.world/'
license=('AGPL-3.0')
source=(
  "https://storage.hachimi.world/distribution/linux/hachimi-world-${pkgver}-${_build_rel}.deb"
  "hachimi_world.desktop"
)
sha256sums=(
  '3c3cd949c5c6d26354be6120668efe5d70f564ed85c76323b419a7b3f6d03c28'
  '6b0f18a105b54197adfd13cc762c93485d538ec2fcc5830cdc1f1b4ee493efc9'
)

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
  install -Dm0644 "../../hachimi_world.desktop" "${pkgdir}/usr/share/applications/hachimi-world.desktop"
  install -Dm0644 "lib/Hachimi_World.png" "${pkgdir}/usr/share/icons/hicolor/512x512/apps/hachimi-world.png"
}

# vim: ts=2 sw=2 et:
