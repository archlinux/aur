# Maintainer: Pete Alexandrou (ozmartian) <pete@ozmartians.com>
pkgname=vidcutter-git
pkgver=3.0.0a.r0.gb9f344e
pkgrel=1
_branch=mpv
pkgdesc="FFmpeg based video cutter & joiner with a modern PyQt5 GUI"
arch=('any')
license=('GPL3')
url="http://vidcutter.ozmartians.com"
# source=('vidcutter-git::git+https://github.com/ozmartian/vidcutter.git')
source=(https://github.com/ozmartian/vidcutter/archive/${_branch}.tar.gz)
depends=('python-pyqt5' 'mpv' 'ffmpeg')
makedepends=('git' 'sed' 'python-setuptools')
install=${pkgname}.install
provides=('vidcutter-git')
conflicts=('vidcutter')
md5sums=('SKIP')

prepare() {
    cd "${srcdir}/vidcutter-${_branch}"
    sed -i "s/pypi/arch/" "vidcutter/__init__.py"
}

build() {
    cd "${srcdir}/vidcutter-${_branch}"
    python setup.py build
}

package() {
    cd "${srcdir}/vidcutter-${_branch}"
    python3 setup.py install --root="${pkgdir}" --optimize=1 --skip-build
    # install -Dm644 "data/desktop/vidcutter.desktop" "${pkgdir}/usr/share/applications/vidcutter.desktop"
    # install -Dm644 "data/icons/vidcutter.png" "${pkgdir}/usr/share/pixmaps/vidcutter.png"
}
