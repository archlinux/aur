# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=storagesifter-bin
_name=${pkgname%-bin}
pkgver=0.4.1
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
b2sums=('b891f4660ef38b2598e36c83f0003b30b0956750550b6ce673a34fd254f9559fed7193c9d552f01e8b1fc500e7cc3494820d310d6f1e8559c5ba3d3528a2ce83'
        '3d36c479a85a84380d3d6eff2fabe698b6c0064059b363fcac38c38ccb631e4798e595687cd082b272d0cffa37bf791a4bf486dc2c4e3bc1aac3b0c6a6f99f65')
b2sums_x86_64=('a5f7dd459c595f81c8a8c8778ffda13dd5d26f3ab7a022cde6d280808ca6e1a0c3fddc36439907ab021acb7bc8411a36c2952d5b48ff7caf2a7ec3ed93554a67')

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
