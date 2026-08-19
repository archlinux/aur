# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=storagesifter-bin
_name=${pkgname%-bin}
pkgver=0.3.0
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
b2sums=('2bf9a3d6b5c4ad1e4ae4d7017a3cc5d9c23ca3f8843556dc272695326949589517e8d2234a8c506262759e300a24d54af2fd84e948c94a06b7cd950c03361498'
        '3d36c479a85a84380d3d6eff2fabe698b6c0064059b363fcac38c38ccb631e4798e595687cd082b272d0cffa37bf791a4bf486dc2c4e3bc1aac3b0c6a6f99f65')
b2sums_x86_64=('b5f443652f10150c1355148649e5584e0a1ffee1c06780112b0ee177589c6d218f2843878baf7effadc1595137b63e472d1345627198cbc6c41749446e7bc1db')

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
