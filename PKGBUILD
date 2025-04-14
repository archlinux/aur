# Maintainer: iiPython <ben at iipython dot dev>

pkgname=iipython-feishin-bin
pkgdesc='Fork of Feishin with additional features.'
pkgver=25.04.13
pkgrel=2
arch=('x86_64')
url='https://github.com/iipythonx/feishin'
license=('GPL3')
depends=('electron35')
optdepends=('mpv: Alternative audio backend')
provides=("${pkgname%-bin}")
conflicts=('feishin')
_filename=feishin-${pkgver//_/-}-linux
source=("feishin.desktop")
source_x86_64=("https://github.com/iipythonx/feishin/releases/download/${pkgver//_/-}/${_filename}-x64.tar.xz")
sha256sums=('356ae0d70814c6631bb9597e62aa11980a426c71d38493345d0a5fc2d8af145f')
sha256sums_x86_64=('f4908e85da01997ba1a9696a61c6011b00035803949d603ca156133ec513910c')

package() {
    # create target file structure
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/"{feishin,pixmaps,applications}
    # extract files to target
    tar -xf ${_filename}-x64.tar.xz -C "$pkgdir/usr/share/feishin" --strip-components=1
    # install icon
    install -Dm644 "$pkgdir/usr/share/feishin/resources/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    # symlink executable to "/usr/bin/feishin"
    ln -s /usr/share/feishin/feishin "${pkgdir}/usr/bin/feishin"
    # install desktop entry
    install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}
