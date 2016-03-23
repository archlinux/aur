# Maintainer: 0strodamus <0strodamus at cox dot net>
# Maintainer: kachelaqa <kachelaqa at gmail dot com>
#
# last released Qt4 version of pkgbrowser

pkgname=pkgbrowser-qt4
_pkgname=pkgbrowser
pkgver=0.18.1
pkgrel=3
pkgdesc="A utility for browsing pacman databases and the AUR (Qt4 version)"
arch=('i686' 'x86_64')
url="https://bitbucket.org/kachelaqa/pkgbrowser"
license=('GPL2')
depends=('pacman' 'python>=3.2' 'python-pyqt4')
provides=($_pkgname)
conflicts=($_pkgname)
replaces=($_pkgname)
install=pkgbrowser.install
source=("$url/downloads/$_pkgname-$pkgver.tar.gz"
        '001-pkgbrowser-qt4-build-fixes.patch'
        '002-pkgbrowser-qt4-aur4-fixes.patch')
sha256sums=('5edcb712ac97b0a616a2bfbee07a4549b4cc8f5e2d777b2e0d12015554e2189b'
            'dbf6b6883759a5a05cfe88f2dab510cf8d1ce1a258bb1f9087eb351fffe0b9b1'
            'dc5bb5cbe809183648f44861f779fc1fa1d88217f357c423198acff0c10d3911')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  # fixes to enable building Qt4 version - see https://bbs.archlinux.org/viewtopic.php?pid=1578506#p1578506
  patch -Np1 -i ../001-pkgbrowser-qt4-build-fixes.patch
  # fixes for AUR4 and Arch Linux Archive
  patch -Np1 -i ../002-pkgbrowser-qt4-aur4-fixes.patch
}

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    make PREFIX='/usr'
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make PREFIX='/usr' DESTDIR="$pkgdir" install
}
