# Maintainer: Ainola <opp310@alh.rqh> (ROT13)
# Contributor: Jurij Podgoršek <gismopwn at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>

pkgname=hydraslayer
pkgver=16.1
pkgrel=1
pkgdesc="Hydra Slayer is a Roguelike inspired by Greek mythology and mathematical puzzles about slaying many-headed beasts."
arch=('i686' 'x86_64')
url="http://www.roguetemple.com/z/hydra.php"
license=('GPL2')
depends=('lua51' 'sdl2_net' 'sdl2_ttf' 'sdl2_image' 'sdl2_mixer' 'glu' 'hicolor-icon-theme')
makedepends=('icoutils')
source=('http://www.roguetemple.com/z/noteye/noteye-81.zip'
        'hydraslayer.sh'
        'hydraslayer.install'
        'hydraslayer.desktop')
sha256sums=('9855be240991ef3817089c615d4f681d02ce00f7adfea74dc536bf4cbf539245'
            '273a77d6101d3fb27f6e7678754507d6b40b6902b058ff71c984d46720ac43b0'
            '0d6b23fc77c1a329af42c5eea29319811d639bfb044958ed1de7c4f94e3879e1'
            '9893af1a84b89c3a6279f67a389405e0421f04ee17682bcac6dd80e5710cec1e')
install=('hydraslayer.install')

build() {
  cd "$srcdir/noteye/src"
  make
}

package(){
  mkdir -p "${pkgdir}/usr/share/hydraslayer"

  cp -r "${srcdir}/noteye/"{common,gfx,games,sound} "${pkgdir}/usr/share/hydraslayer"
  install -Dm755 noteye/hydraslayer "${pkgdir}/usr/share/hydraslayer/hydraslayer"
  install -Dm755 noteye/noteye "${pkgdir}/usr/share/hydraslayer/noteye"
  install -Dm644 noteye/common/dftconfig.noe "${pkgdir}/usr/share/hydraslayer/config.noe"
  install -Dm755 noteye/libnoteye.so "${pkgdir}/usr/share/hydraslayer"
  install -Dm755 "${srcdir}/hydraslayer.sh" "$pkgdir/usr/bin/hydraslayer"

  # Icon
  icotool -x -o "$srcdir" "${srcdir}/noteye/hydra/hydra.ico"
  install -Dm644 "${srcdir}/hydra_1_16x16x32.png" \
                 "${pkgdir}/usr/share/icons/hicolor/16x16/apps/hydraslayer.png"
  install -Dm644 "${srcdir}/hydra_2_32x32x32.png" \
                 "${pkgdir}/usr/share/icons/hicolor/32x32/apps/hydraslayer.png"
  install -Dm644 "${srcdir}/hydra_3_48x48x32.png" \
                 "${pkgdir}/usr/share/icons/hicolor/48x48/apps/hydraslayer.png"

  # .desktop
  install -Dm644 "${srcdir}/hydraslayer.desktop" \
                 "${pkgdir}/usr/share/applications/hydraslayer.desktop"

  # Permissions
  find "${pkgdir}/usr/share/hydraslayer/"{common,gfx,games,sound} -type d -exec chmod 765 "{}" +
  find "${pkgdir}/usr/share/hydraslayer/"{common,gfx,games,sound} -type f -exec chmod 644 "{}" +
}

# vim:set ts=2 sw=2 et:
