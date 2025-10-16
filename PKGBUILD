# Maintainer: Yuannan Lin <yuannan.pm.me>
# Report on Gitlab (https://gitlab.com/yuannan/tetrio-plus) or AUR
# Contributor: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-plus-bin
pkgver=10.0.0
pkgrel=1
pkgdesc='TETR.IO Plus desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
depends=('libxss' 'unzip')
conflicts=('tetrio-desktop')
source=("TETR.IO.deb::https://tetr.io/about/desktop/builds/${pkgver%.*.*}/TETR.IO%20Setup.deb"
        "tetrio-plus.asar.zip::https://gitlab.com/UniQMG/tetrio-plus/-/jobs/11675178434/artifacts/raw/tetrio-plus_v0.27.10_for_desktop_v10.asar.zip"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('e3635a6f8d479bbf8dc56fdee7a65b2cf652e9633ef6e1acfc6c6f7055b4abdf'
            '0beab9551673d1b32e510508a4b833b811ac9642fa552c8af0c1df399b1a9dd6'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    # extracting Debian package data tar
    tar -xf data.tar.xz -C "$pkgdir"

    # subsitution of plus app.asar
    rm -rf "$pkgdir/opt/TETR.IO/resources/app.asar"
    # insertion of app.asar
    unzip tetrio-plus.asar.zip -d "$pkgdir/opt/TETR.IO/resources"

    # inserting executable into
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/TETR.IO" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chmod -R go-w "$pkgdir"
}
