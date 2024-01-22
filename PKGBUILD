# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
pkgname=autocut-git
pkgver=r86.9c9fdf2
pkgrel=1
pkgdesc="Cut videos using a text editor.用文本编辑器剪视频."
arch=('any')
url="https://github.com/mli/autocut"
license=('LicenseRef-Apache')
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
    'python-tqdm'
)
makedepends=(
    'git'
    'python-pipx'
)
source=(
    "${pkgname//-/.}::git+${url}.git"
)
sha256sums=('SKIP')
pkgver() {
    cd "${srcdir}/${pkgname//-/.}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
    cd "${srcdir}/${pkgname//-/.}"
    python setup.py build
}
package() {
    cd "${srcdir}/${pkgname//-/.}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}