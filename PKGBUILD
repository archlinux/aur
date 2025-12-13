# Maintainer: iiPython <ben at iipython dot dev>

pkgname=iipython-feishin-bin
pkgdesc='Fork of Feishin with additional features.'
pkgver=25.12.13
pkgrel=1
arch=('x86_64')
url='https://github.com/iipythonx/feishin'
license=('GPL3')
optdepends=('mpv: Alternative audio backend')
provides=("${pkgname%-bin}")
conflicts=("feishin" "feishin-bin-debug" "feishin-debug")
_filename=feishin-${pkgver//_/-}-linux
source=("feishin.desktop")
source_x86_64=("https://github.com/iipythonx/feishin/releases/download/${pkgver//_/-}-1.0/${_filename}-x64.tar.xz")
sha256sums=('30c140178d7eaf8f7daf100ce73757b4ee521b47465b611263123d5228b81eaf')
sha256sums_x86_64=('7d278282c8e6ab6a56b25496b2b14f2a844204676eb62ec5adaf5f9857a49f18')

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
