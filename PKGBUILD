# Maintainer: dada513 <dada513@protonmail.com>
pkgname=mineclone2-mojang-textures
pkgver=0.72.0
pkgrel=2
pkgdesc="Downloads & converts textures from Minecraft for usage with mineclone"
license=('GPL3' 'custom:proprietary mojang textures')
depends=('minetest')
arch=('any')
makedepends=('python' 'imagemagick' 'unzip')
checkdepends=()
optdepends=('minetest-mineclone2' 'minetest-mineclone5')
source=("https://launcher.mojang.com/v1/objects/0f275bc1547d01fa5f56ba34bdc87d981ee12daf/client.jar" # Minecraft 1.12.2 jar URL obtained from https://launchermeta.mojang.com/mc/game/version_manifest.json
        "https://git.minetest.land/MineClone2/MineClone2/archive/${pkgver}.zip")
sha256sums=('8ada07da5ee77dad3527bd7278fbd05ee1fc8a597813b216a871a2d7d64cc64f'
            '2a3616394596b670fb5aa33460922feef9567ffc4b5e7703eac7b8cf7327857d')
noextract=('client.jar')

prepare() {
	unzip -o ./client.jar "assets/*" -d $srcdir
}

build() {
  cd $srcdir/mineclone2/tools
  mkdir -p $srcdir/out
  python Texture_Converter.py -i $srcdir -o $srcdir/out
}

package() {
  mkdir -p $pkgdir/usr/share/minetest/textures/
  mv $srcdir/out/src $pkgdir/usr/share/minetest/textures/Minecraft
}