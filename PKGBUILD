# Maintainer: iiPython <ben at iipython dot dev>

pkgname=iipython-feishin-bin
pkgdesc='Fork of Feishin with additional features.'
pkgver=11.20.24
pkgrel=1
arch=('x86_64')
url='https://github.com/iipythonx/feishin'
license=('GPL3')
optdepends=('mpv: Alternative audio backend')
provides=("${pkgname%-bin}")
conflicts=('feishin')
_filename=feishin-${pkgver//_/-}-linux
source=("feishin.desktop")
source_x86_64=("https://github.com/iipythonx/feishin/releases/download/${pkgver//_/-}/${_filename}-x64.tar.xz")
sha256sums=('4a947903d139cad3cb8901b0b17d63c4980160c4f1c10dce333fe6d89dfc8fa2')
sha256sums_x86_64=('9192634bd3c09eaaf5fa5187b3d215291f84e35ed829abbd510d6c527da36c3a')

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
