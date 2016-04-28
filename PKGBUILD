# Contributor: Yamashita Ren
# Contributor: Limao Luo <luolimao+AUR@gmail.com>
# Contributor: TuxSpirit <tuxspirit@archlinux.fr>

pkgname=peazip-qt-opensuse-latest
arch=(i686 x86_64)
pkgver=6.0.0
pkgrel=1
pkgdesc="QT archiver utility (openSUSE RPM)"
url=http://peazip.sourceforge.net/peazip-linux.html
license=(Artistic2.0 LGPL2.1)
depends=(curl desktop-file-utils gmp4 libx11 ncurses qt4pas)
optdepends=(p7zip upx)
provides=(${pkgname%-*-*-*} ${pkgname%-*-*})
conflicts=(${pkgname%-*-*-*} ${pkgname%-*-*-*}-gtk2 ${pkgname%-*-*})
if [[ $CARCH == i686 ]]; then _CARCH=i586; else _CARCH=$CARCH; fi
_repo="http://download.opensuse.org/repositories/devel:/languages:/pascal/openSUSE_Factory/${_CARCH}/"
_rpm=$(curl ${_repo} | grep peazip | cut -d'"' -f6)
source=(${_repo}${_rpm})
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir"
    ls peazip*.rpm | cut -d- -f2
}

package() {
    cp -R "$srcdir"/usr $pkgdir/
    cd $pkgdir/usr
    mv share/doc/packages/peazip share/doc
    rmdir share/doc/packages
    mv lib64 lib
}
