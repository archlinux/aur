# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=storagesifter-bin
_name=${pkgname%-bin}
pkgver=0.4.0
pkgrel=1
pkgdesc='A fast, GPU-accelerated disk-usage treemap visualizer'
arch=(x86_64)
url=https://fopull.com/storage-sifter
license=(MIT)
depends=(alsa-lib
         glibc
         hicolor-icon-theme
         libgcc
         libx11
         libxcursor
         libxi
         libxkbcommon
         vulkan-icd-loader
         wayland)
optdepends=('xdg-utils: open file manager/links from within the app')
provides=($_name)
conflicts=($_name)
_rawurl=https://raw.githubusercontent.com/Fopull-LLC/StorageSifter/refs/tags/v$pkgver
source=($_name-$pkgver-CHANGELOG.md::$_rawurl/CHANGELOG.md
        $_name-$pkgver-com.fopull.StorageSifter.metainfo.xml::$_rawurl/packaging/com.fopull.StorageSifter.metainfo.xml)
source_x86_64=(https://github.com/Fopull-LLC/StorageSifter/releases/download/v$pkgver/$_name-v$pkgver-x86_64-linux.tar.gz)
b2sums=('ffb74fb2abdb3226bb827a329609a1f3712d187f82b439852f23c61b310bc9e4cb6ca881c1864f07323a0bdfdcfb5545dd210ed4029c0ec044963c68c67754bd'
        '3d36c479a85a84380d3d6eff2fabe698b6c0064059b363fcac38c38ccb631e4798e595687cd082b272d0cffa37bf791a4bf486dc2c4e3bc1aac3b0c6a6f99f65')
b2sums_x86_64=('afc0866bf5e5ec32912da7a128b11d3d2d6c1e14c6e4fab8cb01e35a3cc234f6a1aaebae0b05d03d7d726253362a523ff95343c304e24be9a4a2d93276e07cbd')

package() {
    cd $_name-v$pkgver-$CARCH-linux
    install -Dm755 $_name -t "$pkgdir/usr/bin"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
    install -Dm644 $_name.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/com.fopull.StorageSifter.png"
    install -Dm644 com.fopull.StorageSifter.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 "$srcdir/$_name-$pkgver-CHANGELOG.md" "$pkgdir/usr/share/doc/$pkgname/CHANGELOG.md"
    install -Dm644 "$srcdir/$_name-$pkgver-com.fopull.StorageSifter.metainfo.xml" \
        "$pkgdir/usr/share/metainfo/com.fopull.StorageSifter.metainfo.xml"
}
