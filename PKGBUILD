# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt-git
pkgrel=1
pkgver=r1732.3092e8f
pkgdesc='An image viewer with vim-like keybindings'
arch=('any')
url='https://github.com/karlch/vimiv-qt'
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git' 'python-setuptools')
optdepends=(
    'qt5-svg: for svg support'
    'python-piexif: for exif support'
    'qt5-imageformats: for additional image formats'
)
conflicts=('vimiv' 'vimiv-git' 'vimiv-qt')
provides=('vimiv')
source=("$pkgname::git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/$pkgname"

    make -f misc/Makefile DESTDIR="$pkgdir" install
}
