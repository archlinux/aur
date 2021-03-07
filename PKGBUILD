# Maintainer: Adam Olech <nddr89@gmail.com>

pkgname=qsixmixer
pkgver=0.2.6
pkgrel=1
pkgdesc="Linux gui mixer for Focusrite Scarlett 6i6"
arch=('x86_64')
url="https://sourceforge.net/projects/qsismixer/"
license=('GPL')
depends=(qt5-base alsa-lib)
source=("https://master.dl.sourceforge.net/project/qsismixer/qsismix.tar.gz")
md5sums=('39af5d46dd68755a132e5b37a3c0bcdf')

build() {
    cd "$srcdir"
    qmake
    make
}

package() {
    cd "$srcdir"
    sed -i -e 's/qsismix.png/audio-card/g' qsismix.desktop
    sed -i -e 's#/usr/local/bin/#/usr/bin/#g' Makefile
    make INSTALL_ROOT="${pkgdir}" install_bin
    install -m644 -D "${srcdir}/qsismix.desktop" "$pkgdir/usr/share/applications/qsixmix.desktop"
}
