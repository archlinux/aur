# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=feishin-bin
pkgdesc='Rewrite of Sonixd'
pkgver=0.1.1
pkgrel=1
arch=('x86_64')
url='https://github.com/jeffvli/feishin'
license=('GPL3')
depends=('mpv') # TODO check node requirements
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
_filename=Feishin-${pkgver//_/-}-linux-x64.tar.xz
source=("feishin.desktop"
        "https://github.com/jeffvli/feishin/releases/download/v${pkgver//_/-}/${_filename}")
sha256sums=('bb664e5e807946fce7d02f14231f8830fac146b4d6641165b2e7cae7eeb1839f'
            'b41c72e49b4f6e57db6a262e510177ea65fe925011516b1eaecf2631948e9388')

package() {
    # create target file structure
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/"{feishin,pixmaps,applications}
    # extract files to target
    tar -xf ${_filename} -C "$pkgdir/usr/share/feishin" --strip-components=1
    # install icon
    install -Dm644 "$pkgdir/usr/share/feishin/resources/assets/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    # symlink executable to "/usr/bin/feishin"
    ln -s /usr/share/feishin/feishin "${pkgdir}/usr/bin/feishin"
    # install desktop entry
    install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}
