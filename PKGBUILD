# Maintainer: everyx <lunt.luo#gmail.com>
# Maintainer: v9pzm7 <751000925#qq.com>
_pkgbase=simple-live-app
pkgname=simple-live-app-bin
_build_id=10803
_version=1.8.3
pkgver=${_version}.${_build_id}
pkgrel=1

pkgdesc='简简单单的看直播'
arch=('x86_64')
url='https://github.com/xiaoyaocz/dart_simple_live'
license=('GPL3')

provides=("$_pkgbase")
# conflicts=("$pkgname-git" "$pkgname-beta")

source_x86_64=("$pkgname-$pkgver.deb::https://github.com/xiaoyaocz/dart_simple_live/releases/download/v${_version}/simple_live_app-${_version}+${_build_id}-linux.deb")
sha256sums_x86_64=('e4adb252adaf2114745d2603c0683b5fcbb0c233c5a41fe69edffe94e0a779d1')
depends=('libmpv.so' 'xdg-user-dirs')
makedepends=('patchelf')
options=(!debug)

package() {
    bsdtar -xf "$srcdir"/data.tar.zst -C "$pkgdir"/

    install -d "$pkgdir"/usr/bin
    ln -s /usr/share/simple_live_app/simple_live_app  "$pkgdir"/usr/bin/

    patchelf --replace-needed libmpv.so.1 libmpv.so "$pkgdir"/usr/share/simple_live_app/lib/libmedia_kit_video_plugin.so
}
