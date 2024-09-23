# Maintainer: iiPython <ben at iipython dot dev>

pkgname=iipython-feishin-bin
pkgdesc='Fork of Feishin with additional features.'
pkgver=09.23.24
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
sha256sums=('0baca70e978f553348b406994b22d6357e5e239e8dc0229087cd4b3e315973d1')
sha256sums_x86_64=('65a03b327ba9490b655d318182dd67ad7f6d98b58fe3a6055d3d651d7ee9d7f9')

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
