# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=feishin-bin
pkgdesc='Rewrite of Sonixd'
pkgver=0.0.1_alpha6
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
            '1bf6711f964566a77061911d5f0e155f3e99a4b2d51e469bbf4f6e2dc74c9b84')

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
