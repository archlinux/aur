# Maintainer: taotieren <admin@taotieren.com>

pkgbase=tinycorrect-git
pkgname=tinycorrect
pkgver=0.1.r23.gfd2d32a
pkgrel=1
pkgdesc="Auto detect & correct typeset, inline code, toc, file name, header, images, urls and words of Markdown documents, originally written for the RISC-V Linux project: https://gitee.com/tinylab/riscv-linux."
arch=(any)
url="https://gitee.com/tinylab/tinycorrect"
license=('GPL-2.0')
groups=('tinylab-git')
provides=(${pkgbase%-git})
conflicts=(${pkgbase%-git})
replaces=()
depends=(
    autocorrect
    vim-pangu
    autocorrect
    python-pycorrector
    python-xmnlp
)
makedepends=(git)
checkdepends=()
optdepends=()
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')
options=('!strip')

pkgver() {
    cd "${srcdir}/${pkgname}/"
    git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    cd "${srcdir}/${pkgname}/"

    install -Dm755 ${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 -t "${pkgdir}/usr/share/licenses/$pkgname/" COPYING
    install -Dm644 -t "${pkgdir}/usr/share/doc/$pkgname/" README.md
    ln -sf "/usr/bin/${pkgname}" "${pkgdir}/usr/bin/tico"
}
