# Maintainer: Christian Karl <karlch at protonmail dot com>

pkgname=vimiv-qt-git
pkgrel=1
pkgver=r2066.41d9382d
pkgdesc='An image viewer with vim-like keybindings'
arch=('any')
url='https://github.com/karlch/vimiv-qt'
license=('GPL3')
depends=('python-pyqt5')
makedepends=('git' 'python-setuptools')
optdepends=(
    'qt5-svg: for svg support'
    'qt5-imageformats: for additional image formats'
    'python-exiv2: for exif support'
    'python-piexif: alternative for exif support'
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
