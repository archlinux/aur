# Maintainer: Yuannan Lin <yuannan.pm.me>
# Report on Gitlab (https://gitlab.com/yuannan/tetrio-plus) or AUR
# Contributor: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-plus-bin
pkgver=9.0.0
pkgrel=0
pkgdesc='TETR.IO Plus desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
depends=('libxss' 'unzip')
conflicts=('tetrio-desktop')
source=("TETR.IO.deb::https://tetr.io/about/desktop/builds/${pkgver%.*.*}/TETR.IO%20Setup.deb"
        "tetrio-plus_v0.27.2_for_desktop_v9.asar.zip::https://gitlab.com/UniQMG/tetrio-plus/-/jobs/6734605389/artifacts/raw/tetrio-plus_v0.27.2_for_desktop_v9.asar.zip"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('52b88bc0c07c0fefd3df61f8acf6e4240cbf17f14584da5dfbed0047597011fb'
            '094a871dd7800e4dd830d6f81890a6867ab9824fb29f57b0723b76b30ad7fea1'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    # extracting Debian package data tar
    tar -xf data.tar.xz -C "$pkgdir"

    # subsitution of plus app.asar
    rm -rf "$pkgdir/opt/TETR.IO/resources/app.asar"
    # insertion of app.asar
    unzip tetrio-plus_v0.27.2_for_desktop_v9.asar.zip -d "$pkgdir/opt/TETR.IO/resources"

    # inserting executable into
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/TETR.IO" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chmod -R go-w "$pkgdir"
}
