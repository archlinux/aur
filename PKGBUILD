# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

_pkgname=librewolf-extension-vimiumc
pkgname=$_pkgname-bin
pkgver=2.12.3
pkgrel=1
pkgdesc='A keyboard shortcut browser extension for keyboard-based navigation and tab operations with an advanced omnibar'
url=https://addons.mozilla.org/en-US/firefox/addon/vimium-c
arch=('any')
license=('custom')
depends=('librewolf')
provides=("$_pkgname")
conflicts=("$_pkgname")
groups=('librewolf-addons')
noextract=("vimium_c-$pkgver.xpi")
_number=4474326
source=("vimium-c@gdh1995.cn.xpi::https://addons.mozilla.org/firefox/downloads/file/$_number/vimium_c-$pkgver.xpi"
        "https://raw.githubusercontent.com/gdh1995/vimium-c/master/LICENSE.txt")
sha256sums=('e1a4f8cc13791dfb985c2a78d33df1e8a40f23bd6eca9217165cb748009df540'
            '74cf78c0a915c141f656a9fce1dac48a440d2328e262cf7714f06cd1889bec79')

check() {
  bsdtar xOf vimium-c@gdh1995.cn.xpi manifest.json|jq --arg v ${pkgver} -e '.version==$v'
}

package() {
  install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname-bin"
  install -Dm644 vimium-c@gdh1995.cn.xpi "$pkgdir/usr/lib/librewolf/browser/extensions/vimium-c@gdh1995.cn.xpi"
}
