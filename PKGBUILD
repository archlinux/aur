# Maintainer: RealStickman <mrc+aur@frm01.net>

pkgname=feishin-bin
pkgdesc='Rewrite of Sonixd'
pkgver=0.5.2
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
sha256sums=('ef112b1a9ef80d8bf27f721fdbb12de0a195da4e464dbf27282503ba398bef8d'
            'ff33d5ffda390fbd79077089d02c37c836e61a0eadfac14d6f0cf035def45c1d')

package() {
    # create target file structure
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/"{feishin,pixmaps,applications}
    # extract files to target
    tar -xf ${_filename} -C "$pkgdir/usr/share/feishin" --strip-components=1
    # install icon
    install -Dm644 "$pkgdir/usr/share/feishin/resources/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    # symlink executable to "/usr/bin/feishin"
    ln -s /usr/share/feishin/feishin "${pkgdir}/usr/bin/feishin"
    # install desktop entry
    install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}
