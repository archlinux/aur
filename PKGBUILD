# Maintainer: Artem Varaksa <artvaraksa@gmail.com>
# Contributor: Alexis Couronne <alexis@skitoo.net>

pkgname=magicavoxel
version_main=0.99.4
version_suffix=2
pkgver="$version_main.$version_suffix"
pkgrel=2
pkgdesc='A free lightweight 8-bit voxel art editor and GPU based interactive path tracing renderer'
arch=('x86_64')
url="http://ephtracy.github.io/"
source=("https://github.com/ephtracy/ephtracy.github.io/releases/download/$version_main/MagicaVoxel-$pkgver-alpha-win64.zip"
	      "https://github.com/ephtracy/ephtracy.github.io/releases/download/$version_main/plugin-win64.zip"
        'magicavoxel'
        'magicavoxel.desktop'
        'LICENSE')
license=('custom')
depends=(wine)
makedepends=(unzip icoutils)
noextract=("MagicaVoxel-$pkgver-alpha-win64.zip"
	         'plugin-win64.zip')
sha256sums=('1e52c08448527814aecc3fa2c1051ad9401a9ce43dfbb86ce03cd74e6fe81820'
	          'a488d17099e8b42478043fda21c0867c3f6bd14f6e41a8381edefff95870277a'
            '674c96989ad28f666230ff9e53a07b2f68a3173f4db14d6014e001042f82a822'
            '29cb5e2a6a3791476c49b2fc4ac9136aa2a2f31cb5fc4beaf628e965f1f7bc60'
            '16dae99105daf174b752cd8f55be2928bccb617dec6297bd32c672267e58334e')

prepare() {
  unzip -o "MagicaVoxel-$pkgver-alpha-win64.zip"
  unzip -o plugin-win64.zip -d "MagicaVoxel-$pkgver-alpha-win64"
}

build() {
  wrestool -x --output=magicavoxel.ico -t14 "MagicaVoxel-$pkgver-alpha-win64/MagicaVoxel.exe"
  icotool -x magicavoxel.ico -o magicavoxel.png
}

package() {
  install -dm755 "$pkgdir/usr/share/magicavoxel"
  cp -ra "$srcdir/MagicaVoxel-$pkgver-alpha-win64/." "$pkgdir/usr/share/magicavoxel"

  install -dm755 "$pkgdir/usr/bin"
  install -m755 magicavoxel "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 magicavoxel.desktop "$pkgdir/usr/share/applications/magicavoxel.desktop"

  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 magicavoxel.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/magicavoxel.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
