# Maintainer: Yuannan Lin <yuannan.pm.me>
# Report on Gitlab (https://gitlab.com/yuannan/tetrio-plus) or AUR
# Contributor: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-plus-bin
pkgver=8.0.0
pkgrel=4
pkgdesc='TETR.IO Plus desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
depends=('libxss' 'unzip')
conflicts=('tetrio-desktop')
source=("TETR.IO.deb::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        "tetrio-plus_app.asar.zip::https://gitlab.com/UniQMG/tetrio-plus/uploads/a9647feffc484304ee49c4d3fd4ce718/tetrio-plus_0.23.13_app.asar.zip"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('ae07110f88692e1485f7ef1d3ab5eff95774746631b17833e28cc09ba1a38bda'
            '7860e50d8e570cb7fed727050c72e42381eb3812a9874426742fcf8dfaaecc00'
            '5e721783706e2018878ca127ec6ed5d6a1298ee9cc6a853329e25fafe45265f9')

package() {
    cd "$srcdir"

    # extracting Debian package data tar
    tar -xf data.tar.xz -C "$pkgdir"

    # subsitution of plus app.asar
    rm -rf "$pkgdir/opt/TETR.IO/resources/app.asar"
    # insertion of app.asar
    unzip tetrio-plus_app.asar.zip -d "$pkgdir/opt/TETR.IO/resources"

    # inserting executable into
    mkdir -p "$pkgdir/usr/bin"
    ln -sf "/opt/TETR.IO/tetrio-desktop" "$pkgdir/usr/bin/$pkgname"

    install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chmod -R go-w "$pkgdir"
}
