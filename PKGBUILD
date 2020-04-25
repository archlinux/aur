# Maintainer: Artem Varaksa <artvaraksa@gmail.com>
# Contributor: Alexis Couronne <alexis@skitoo.net>

pkgname=magicavoxel
_version_main='0.99.5'
_version_suffix=''
pkgver="$_version_main$_version_suffix"
pkgrel=4
pkgdesc='A free lightweight 8-bit voxel art editor and GPU based interactive path tracing renderer'
arch=('x86_64')
url="http://ephtracy.github.io/"
source=("https://github.com/ephtracy/ephtracy.github.io/releases/download/$_version_main/MagicaVoxel-$pkgver-alpha-win64.zip"
        "https://github.com/ephtracy/ephtracy.github.io/releases/download/0.01/plugin-intel-denoiser-win64.zip"
        'magicavoxel'
        'magicavoxel.desktop'
        'LICENSE')
license=('custom')
depends=(wine)
makedepends=(unzip icoutils)
noextract=("MagicaVoxel-$pkgver-alpha-win64.zip"
           'plugin-intel-denoiser-win64.zip')
sha512sums=('1aaff14029daea0e280e70903639ed2afd0619b08915717226d43d213a1925608df9826e834721892a88f82cff6b7df94eba9cacd9d448181e4b14c187c843d3'
            '23fe26a26dad536810a21fda5565c97d520961b63d06ed5e3aae170a5c636a3c202c9ab40ce80486ff6fca5d34e3ab1a48cabedc43ad678236b4e4abbc0ab67a'
            '9c5aa5de457e7ae3f7cd5d563414600778b65bd60a9e02c7fe3b01289b667777ca0b9f4954b51d0a06c414489e5168f7f995d13799b1bd5af3ea5aace623adc7'
            '0872398e0d52df23a4910c3c5257f073f96bbf06db197ebdaf59598ca39d1351c6412598ac46b1eb24ba2a47db8ce7d804d227dc847260c8dbd6213396e816c1'
            'feabbff40cef5402aac75d8344acf434079250c25e05c6bc91af705f1254e0010caaf5e64450fee4ec7d4636ec930a5600412bbc3f588149e7ee0cbeefb0e5ae')

prepare() {
  unzip -o "MagicaVoxel-$pkgver-alpha-win64.zip"
  unzip -o plugin-intel-denoiser-win64.zip -d "MagicaVoxel-$pkgver-alpha-win64"
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
