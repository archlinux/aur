# Maintainer: Artem Varaksa <artvaraksa@gmail.com>
# Contributor: Alexis Couronne <alexis@skitoo.net>

pkgname=magicavoxel
_version_main='0.99.5'
_version_suffix=''
_version_upstream="$_version_main$_version_suffix"
_version_release='.rel1'
pkgver="$_version_upstream$_version_release"
pkgrel=1
pkgdesc='A free lightweight 8-bit voxel art editor and GPU based interactive path tracing renderer'
arch=('x86_64')
url="http://ephtracy.github.io/"
_version_plugin='0.01'
source=("$pkgname-$pkgver.zip::https://github.com/ephtracy/ephtracy.github.io/releases/download/$_version_main/MagicaVoxel-$_version_upstream-alpha-win64.zip"
        "$pkgname-plugin-$_version_plugin.zip::https://github.com/ephtracy/ephtracy.github.io/releases/download/$_version_plugin/plugin-intel-denoiser-win64.zip"
        'magicavoxel'
        'magicavoxel.desktop'
        'LICENSE')
license=('custom')
depends=(wine)
makedepends=(icoutils)
sha512sums=('a5c5ce2fe5238df2e20f7f6cfb8416e40420861d2856cdacbf804be4825ade0020ba6b276b2dd18cc544afa8adbd3d986d81a8b0fb12463e7ae4cec3bbcd7bfa'
            '23fe26a26dad536810a21fda5565c97d520961b63d06ed5e3aae170a5c636a3c202c9ab40ce80486ff6fca5d34e3ab1a48cabedc43ad678236b4e4abbc0ab67a'
            '9c5aa5de457e7ae3f7cd5d563414600778b65bd60a9e02c7fe3b01289b667777ca0b9f4954b51d0a06c414489e5168f7f995d13799b1bd5af3ea5aace623adc7'
            '0872398e0d52df23a4910c3c5257f073f96bbf06db197ebdaf59598ca39d1351c6412598ac46b1eb24ba2a47db8ce7d804d227dc847260c8dbd6213396e816c1'
            'feabbff40cef5402aac75d8344acf434079250c25e05c6bc91af705f1254e0010caaf5e64450fee4ec7d4636ec930a5600412bbc3f588149e7ee0cbeefb0e5ae')

build() {
  wrestool -x --output=magicavoxel.ico -t14 "MagicaVoxel-$_version_upstream-alpha-win64/MagicaVoxel.exe"
  icotool -x magicavoxel.ico -o magicavoxel.png
}

package() {
  install -dm755 "$pkgdir/usr/share/magicavoxel"
  cp -ra "MagicaVoxel-$_version_upstream-alpha-win64/." plugin OpenImageDenoise.dll tbb.dll tbbmalloc.dll "$pkgdir/usr/share/magicavoxel"

  install -dm755 "$pkgdir/usr/bin"
  install -m755 magicavoxel "$pkgdir/usr/bin"

  install -dm755 "$pkgdir/usr/share/applications"
  install -m644 magicavoxel.desktop "$pkgdir/usr/share/applications/magicavoxel.desktop"

  install -dm755 "$pkgdir/usr/share/icons/hicolor/256x256/apps"
  install -m644 magicavoxel.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/magicavoxel.png"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
