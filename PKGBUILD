# Maintainer: iiPython <ben at iipython dot dev>

pkgname=iipython-feishin-bin
pkgdesc='Fork of Feishin with additional features.'
pkgver=07.12.24
pkgrel=2
arch=('x86_64')
url='https://github.com/iipythonx/feishin'
license=('GPL3')
optdepends=('mpv: Alternative audio backend')
provides=("${pkgname%-bin}")
conflicts=('feishin')
_filename=feishin-linux
source=("feishin.desktop")
source_x86_64=("https://github.com/iipythonx/feishin/releases/download/${pkgver//_/-}/${_filename}-x64.tar.xz")
sha256sums=('8ccfdfab92cc88bde82656dcd718b36488d3d15c84ab5afcf1679a5a2cb33f75')
sha256sums_x86_64=('ab7ea4b36107b84f885baf0efad20dd69e2acba91d4729b74b9184f2054f8cfd')

package() {
    # create target file structure
    mkdir -p "$pkgdir/usr/bin"
    mkdir -p "$pkgdir/usr/share/"{feishin,pixmaps,applications}
    # HACK rename package correctly
    mv ${_filename}-x64.tar.xz ${_filename}-$CARCH.tar.xz
    # extract files to target
    tar -xf ${_filename}-$CARCH.tar.xz -C "$pkgdir/usr/share/feishin" --strip-components=1
    # install icon
    install -Dm644 "$pkgdir/usr/share/feishin/resources/assets/icons/icon.png" "$pkgdir/usr/share/pixmaps/${pkgname%-bin}.png"
    # symlink executable to "/usr/bin/feishin"
    ln -s /usr/share/feishin/feishin "${pkgdir}/usr/bin/feishin"
    # install desktop entry
    install -Dm644 feishin.desktop "$pkgdir/usr/share/applications/"
}
