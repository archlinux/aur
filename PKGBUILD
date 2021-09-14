# Maintainer: taotieren <admin@taotieren.com>

pkgname=sunxi-blobs-git
pkgver=3e6b186
pkgrel=1
pkgdesc="The goal of this project is to understand the various blobs provided by Allwinner for their sunxi series of ARM SoCs."
arch=('any')
url="https://github.com/smaeul/sunxi-blobs"
license=('Custom')
provides=(${pkgname})
conflicts=(${pkgname} ${pkgname%-git})
#replaces=(${pkgname})
depends=('bash')
makedepends=('git')
backup=()
options=('!strip')
#install=${pkgname}.install
source=("${pkgname%-git}::git+https://hub.fastgit.org/smaeul/sunxi-blobs.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
#     git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    git describe --always | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
    install -dm0755 "${pkgdir}/opt/${pkgname%-git}/" \
                    "${pkgdir}/usr/bin" \
                    "${pkgdir}/usr/share/licenses/${pkgname%-git}"

    cp -r "${srcdir}/${pkgname%-git}/." "${pkgdir}/opt/${pkgname%-git}/"
    ln -sf "/opt/${pkgname%-git}/scripts/bin2elf" "${pkgdir}/usr/bin/${pkgname%-blobs-git}-bin2elf"
    ln -sf "/opt/${pkgname%-git}/scripts/callgraph" "${pkgdir}/usr/bin/${pkgname%-blobs-git}-callgraph"
    ln -sf "/opt/${pkgname%-git}/scripts/compare" "${pkgdir}/usr/bin/${pkgname%-blobs-git}-compare"
    ln -sf "/opt/${pkgname%-git}/scripts/genstrings" "${pkgdir}/usr/bin/${pkgname%-blobs-git}-genstrings"
    ln -sf "/opt/${pkgname%-git}/scripts/gensyms" "${pkgdir}/usr/bin/${pkgname%-blobs-git}-gensyms"
    ln -sf "/opt/${pkgname%-git}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
