# Maintainer: Robin Ekman < robin.seth.ekman [at] gmail [dot] com >

_pkgbase=xapers
pkgname=xapers-git
pkgver=0.9.0.r40.g7471e67
pkgrel=1
pkgdesc="Personal journal article management system"
url='https://gitlab.com/jrollins/xapers'
arch=('any')
license=('GPL3')
options=('zipman')
depends=('python3' 'python-xapian' 'python-pybtex' 'python-pycurl' 'poppler')
optdepends=('python-urwid: Python Urwid curses library'
'xdg-utils: Desktop tools for opening files and URLs'
'xclip: X clipboard support for copying document fields')
source=('git+https://gitlab.com/jrollins/xapers.git'
    'empty_tags.patch'
    'no_close.patch'
    )
sha256sums=('SKIP'
            '6d5337162b5abec2dab1183b7288c380d558bb6d1978a1881694fa410d4eff3e'
            'acffee0a8b31e19d3beb3105b62822ec13c4f8eed28ba68f294cca7cdf797c8f')

provides=("${pkgname}")

prepare() {
    cd "${_pkgbase}"
    patch -p1 < "${srcdir}/empty_tags.patch"
    patch -p1 < "${srcdir}/no_close.patch"
}

pkgver() {
    cd "${_pkgbase}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd $_pkgbase
	python setup.py build
}

package() {
	cd $_pkgbase
	python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
