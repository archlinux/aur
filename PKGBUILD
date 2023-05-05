# Maintainer: Yuannan Lin <yuannan.pm.me>
# Report on Gitlab (https://gitlab.com/yuannan/tetrio-plus) or AUR
# Contributor: Denton Liu <liu.denton@gmail.com>

pkgname=tetrio-plus-bin
pkgver=8.0.1
pkgrel=0
pkgdesc='TETR.IO Plus desktop client'
arch=('x86_64')
license=('custom')
url='https://tetr.io/'
depends=('libxss' 'unzip')
conflicts=('tetrio-desktop')
source=("TETR.IO.deb::https://tetr.io/about/desktop/builds/TETR.IO%20Setup.deb"
        "tetrio-plus_app.asar.zip::https://gitlab.com/UniQMG/tetrio-plus/uploads/684477053451cd0819e2c84e145966eb/tetrio-plus_0.25.3_app.asar.zip"
        LICENSE) # https://tetr.io/about/terms/
sha256sums=('ae07110f88692e1485f7ef1d3ab5eff95774746631b17833e28cc09ba1a38bda'
            '027860da3334a6045621546600d04fea75ae45f9fba2b85b75183c34b8ee59d3'
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
