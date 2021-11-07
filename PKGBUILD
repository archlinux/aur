# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=xiaomi-adb-fastboot-tools-bin
_pkgname=XiaomiADBFastbootTools
pkgver=7.0.3
pkgrel=1
pkgdesc="Simple tool for managing Xiaomi devices on desktop using ADB and Fastboot (official jar release)"
arch=(any) 
url="https://szaki.github.io/XiaomiADBFastbootTools/"  
license=('MIT')
provides=('xiaomi-adb-fastboot-tools')
conflicts=('xiaomi-adb-fastboot-tools')
depends=('java-runtime>=11' 'android-tools')
makedepends=('gendesk')
source=("$_pkgname-$pkgver.jar::https://github.com/Szaki/$_pkgname/releases/download/$pkgver/$_pkgname.jar"
        "LICENSE-$pkgver.txt::https://cdn.jsdelivr.net/gh/Szaki/$_pkgname@$pkgver/LICENSE"
        "icon-$pkgver.png::https://cdn.jsdelivr.net/gh/Szaki/$_pkgname@$pkgver/src/main/resources/icon.png"
        "$_pkgname.sh")
sha256sums=('30bd4e68c00cb778abafc1def5032268d6739b352470ac70c258021ae82cbd19'
            '0fb637efe3fd3bf9883b112f63ea0cc6ab3697d36f7367f5b4c8fceb313b448c'
            'af83f91ffaa52bbf10e6175b44e0b0d4265f9834380f64d4c9cd4185dd52bbde'
            '8ebc7e841926a4b5e287a4715087234ac890a4b08bf017cd6654881f5c0bbeef')
noextract=("$_pkgname-$pkgver.jar")

prepare() {
  gendesk -f -n --pkgname=$_pkgname --pkgdesc="$pkgdesc" --categories='Application;Utility'
}

package() {
  install -Dm755 $_pkgname.sh "$pkgdir/usr/bin/$_pkgname"
  install -Dm755 $_pkgname.desktop "$pkgdir/usr/share/applications/$_pkgname.desktop"
  install -Dm644 $_pkgname-$pkgver.jar "$pkgdir/usr/share/java/$_pkgname/$_pkgname.jar"
  install -Dm644 LICENSE-$pkgver.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 icon-$pkgver.png "$pkgdir/usr/share/pixmaps/$_pkgname.png"
}
