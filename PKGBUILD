# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: b4283 <damispirit@gmail>

pkgname=blockling
pkgver=r220
pkgrel=2
pkgdesc="A puzzle game involving moving and stacking blocks with 8-bit graphics and sounds."
arch=('i686' 'x86_64')
license=('GPLv3')
url="http://sourceforge.net/projects/blockling/"
depends=(sdl sdl_mixer)
source=(http://downloads.sourceforge.net/project/blockling/blockling-src-${pkgver}.tar.gz)
md5sums=('d02118886db7ee036c598f4a6d4565af')

build() {
    cd $srcdir/blockling-$pkgver/

    sed -i 's,DATADIR=data/,DATADIR=/usr/share/blockling/data/,' Makefile
    make
}

package() {
    mkdir -p ${pkgdir}/usr/share/blockling ${pkgdir}/usr/bin

    cd ${srcdir}/blockling-$pkgver
    cp -r blockling data ${pkgdir}/usr/share/blockling

    BIN=${pkgdir}/usr/bin/blockling
    cat <<EOF > $BIN
#!/bin/sh

cd \$HOME
/usr/share/blockling/blockling
EOF

    chmod +x $BIN
}
