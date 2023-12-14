# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autocut-git
pkgver=r84.638f6d8
pkgrel=1
pkgdesc="Cut videos using a text editor.用文本编辑器剪视频."
arch=('any')
url="https://github.com/mli/autocut"
license=('Apache')
conflicts=(
    "${pkgname%-git}"
)
provides=(
    "${pkgname%-git}"
)
depends=(
    'python'
    'ffmpeg'
    'python-importlib-metadata'
    'python-setuptools'
    'opencc'
)
makedepends=(
    'git'
    'python-pipx'
)
source=(
    "${pkgname%-git}::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py build
}
package() {
    cd "${srcdir}/${pkgname%-git}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}