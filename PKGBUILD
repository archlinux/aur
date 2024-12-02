# Maintainer: everyx <lunt.luo#gmail.com>
# Maintainer: v9pzm7 <751000925#qq.com>
_pkgbase=simple-live-app
pkgname=simple-live-app-bin
_build_id=10705
_version=1.7.5
pkgver=${_version}.${_build_id}
pkgrel=1

pkgdesc='简简单单的看直播'
arch=('x86_64')
url='https://github.com/xiaoyaocz/dart_simple_live'
license=('GPL3')

provides=("$_pkgbase")
# conflicts=("$pkgname-git" "$pkgname-beta")

source_x86_64=("$pkgname-$pkgver.deb::https://github.com/xiaoyaocz/dart_simple_live/releases/download/v${_version}/simple_live_app-${_version}+${_build_id}-linux.deb")
sha256sums_x86_64=('74a0f11a5a9c03cde859df727855bf83c3958b4a53c5115bbe8cf64afda9af3b')
depends=('libmpv.so' 'xdg-user-dirs')
makedepends=('patchelf')
options=(!debug)

package() {
    bsdtar -xf "$srcdir"/data.tar.zst -C "$pkgdir"/

    install -d "$pkgdir"/usr/bin
    ln -s /usr/share/simple_live_app/simple_live_app  "$pkgdir"/usr/bin/

    patchelf --replace-needed libmpv.so.1 libmpv.so "$pkgdir"/usr/share/simple_live_app/lib/libmedia_kit_video_plugin.so
    patchelf --replace-needed libmpv.so.1 libmpv.so "$pkgdir"/usr/share/simple_live_app/lib/libmedia_kit_native_event_loop.so
}
