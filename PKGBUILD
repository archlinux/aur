# Maintainer:  Greg Minshall <minshall at umich dot edu>
pkgname=tpopup
pkgver=0.2.3
pkgrel=1
pkgdesc="simple popup with text from file or command line (Qt6)"
arch=(any)
url="https://sr.ht/~minshall/tpopup/"
license=('MIT')
depends=('python>=3.10' 'python-pyqt6' 'python-tomli' 'python-pyxdg')
makedepends=('asciidoc' 'emacs' 'git' 'python-build' 'python-installer')
# git rev-parse ${pkgver} [copy from above] in upstream repo:
# git rev-parse x.y.z
_tag=9e58e93cfd0e63f01e694ef206ee0a36a037388a
source=(git+https://git.sr.ht/~minshall/tpopup#tag=${_tag}?signed)
validpgpkeys=(
    BB68C8D3A3D23B9B398FB50AC397C74C54A9EC4F # Greg Minshall <minshall@acm.org>
)
sha256sums=('SKIP')


pkgver() {
    cd "${pkgname}"
    git describe
}

build() {
    cd "${pkgname}"
    make pythonbuild
}

check() {
    cd "${pkgname}"
}

package() {
    cd "${pkgname}"

    make DESTDIR="${pkgdir}" PREFIX=/usr pythoninstall
    # install our MIT license
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
