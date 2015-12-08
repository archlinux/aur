# Maintainer: 0strodamus <0strodamus at cox dot net>
# Maintainer: kachelaqa <kachelaqa at gmail dot com>
#
# last released Qt4 version of pkgbrowser

pkgname=pkgbrowser-qt4
_pkgname=pkgbrowser
pkgver=0.18.1
pkgrel=1
pkgdesc="A utility for browsing pacman databases and the AUR (Qt4 Version)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/kachelaqa/pkgbrowser"
license=('GPL2')
depends=('pacman>=4.1' 'pacman<4.3' 'python>=3.2' 'python-pyqt4')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
install=pkgbrowser.install
source=("$url/downloads/$_pkgname-$pkgver.tar.gz"
        '001-pkgbrowser-qt4-fixes.patch')
sha256sums=('5edcb712ac97b0a616a2bfbee07a4549b4cc8f5e2d777b2e0d12015554e2189b'
            '9de7d8bcd20177e2c978a6df88948b6a1c19704e211f3a7a2d9378a797631aea')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # fixes to enable building Qt4 version - see https://bbs.archlinux.org/viewtopic.php?pid=1578506#p1578506
  patch -Np1 -i ../001-pkgbrowser-qt4-fixes.patch
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
