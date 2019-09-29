# Maintainer: Joseph Ryan <josephryan3.14@gmail.com>
pkgname=mms-git
pkgver=1.0
pkgrel=1
pkgdesc="Graphical Micromouse simulator"
arch=('any')
url="https://github.com/mackorone/mms"
license=('MIT')
makedepends=('gendesk')
depends=('qt5-base' 'hicolor-icon-theme')
source=('git+https://github.com/mackorone/mms.git'
    'git+https://github.com/micromouseonline/mazefiles.git'
    'icon.png')
md5sums=('SKIP'
    'SKIP'
    'f3145780df5e9e693895a0a955f5b34a')
_name='mms'
_categories='Simulator'

prepare() {
    gendesk -n -f ../PKGBUILD
}

build() {
    cd $srcdir/mms/src
    qmake && make
}

package() {
    mkdir -p $pkgdir/usr/share/mms
    mkdir -p $pkgdir/usr/bin/
    mkdir -p $pkgdir/usr/share/icons/hicolor/64x64/apps/
    install -Dm644 "${srcdir}/mms.desktop" \
        "$pkgdir/usr/share/applications/mms.desktop"
    cp $srcdir/icon.png $pkgdir/usr/share/icons/hicolor/64x64/apps/mms.png
    cp $srcdir/mazefiles/classic/* $pkgdir/usr/share/mms
    cp $srcdir/mms/bin/mms $pkgdir/usr/bin/mms
    chmod +x $pkgdir/usr/bin/mms
}
