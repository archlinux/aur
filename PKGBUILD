# Maintainer: Artem Varaksa <artvaraksa@gmail.com>
# Contributor: Alexis Couronne <alexis@skitoo.net>

pkgname=magicavoxel
_version_main=0.99.4
_version_suffix=2
pkgver="$_version_main.$_version_suffix"
pkgrel=3
pkgdesc='A free lightweight 8-bit voxel art editor and GPU based interactive path tracing renderer'
arch=('x86_64')
url="http://ephtracy.github.io/"
source=("https://github.com/ephtracy/ephtracy.github.io/releases/download/$_version_main/MagicaVoxel-$pkgver-alpha-win64.zip"
        "https://github.com/ephtracy/ephtracy.github.io/releases/download/$_version_main/plugin-win64.zip"
        'magicavoxel'
        'magicavoxel.desktop'
        'LICENSE')
license=('custom')
depends=(wine)
makedepends=(unzip icoutils)
noextract=("MagicaVoxel-$pkgver-alpha-win64.zip"
           'plugin-win64.zip')
sha512sums=('0feee4d645b49076e48e375fec1ab49ad72ac778dbb0cfbacdc7e1a7888487a1c64a5f6c166c843c711c09bdb0f74a9be7f97c589d0abb1f3e4fb315a6b85de9'
            '23fe26a26dad536810a21fda5565c97d520961b63d06ed5e3aae170a5c636a3c202c9ab40ce80486ff6fca5d34e3ab1a48cabedc43ad678236b4e4abbc0ab67a'
            '9c5aa5de457e7ae3f7cd5d563414600778b65bd60a9e02c7fe3b01289b667777ca0b9f4954b51d0a06c414489e5168f7f995d13799b1bd5af3ea5aace623adc7'
            '0872398e0d52df23a4910c3c5257f073f96bbf06db197ebdaf59598ca39d1351c6412598ac46b1eb24ba2a47db8ce7d804d227dc847260c8dbd6213396e816c1'
            '7afbd94a13d862c03fce295f7229258dce44fd7c511d5d2ba9209a2577b7dc471e43deced5ef847f695e832b797c898a289024c5e313f9d06de69e74733ae938')

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
