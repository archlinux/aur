# Maintainer: Shuyuan Liu <liu_shuyuan@qq.com>

pkgname=issie
pkgver=2.4.5
pkgrel=1
pkgdesc='Digital electronics schematic editor and simulator'
arch=('x86_64' 'arm64')
url='https://github.com/tomcl/ISSIE'
license=('GPL3')

depends=('hicolor-icon-theme' 'zlib')
makedepends=('nodejs-lts-fermium' 'npm' 'dotnet-sdk')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomcl/issie/archive/refs/tags/v$pkgver.tar.gz"
        "issie.desktop")
sha256sums=('ef90bdacd653dc0cc5e0e28b5789dce2bb08af943b668ab2d6304b2209f1a23c'
            '047d4635c7ada3742f76cae84b4a85892c39005c74e309ceebc0e80c325b3d3b')

build() {
    cd "$pkgname-$pkgver"
    dotnet tool restore
    dotnet paket install
    npm update
    npm run dist
}

package() {
    install -D -m 644 issie.desktop "$pkgdir"/usr/share/applications/issie.desktop
    install -D -m 755 "$pkgname-$pkgver"/dist/issie-$pkgver.AppImage "$pkgdir"/opt/appimages/issie.AppImage
    install -D -m 644 "$pkgname-$pkgver"/build/icon.png "$pkgdir"/usr/share/icons/hicolor/512x512/apps/issie.png
}

