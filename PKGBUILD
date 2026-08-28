# Maintainer: taotieren <admin@taotieren.com>

pkgbase=dsview-abz-decoder-git
pkgname=dsview-abz-decoder-git
pkgver=r4.6f30c68
pkgrel=1
pkgdesc="incremental rotary encoder, protocal decodes of DSView 增量式旋转编码器的协议解码"
arch=(any)
url="https://github.com/Ging-H/DSView_PD_Encoder"
license=(GPL-2.0-or-later)
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
replaces=()
depends=()
makedepends=(
    git
)
optdepends=(
    "dsview: GUI programe for supporting various instruments from DreamSourceLab, including logic analyzer, oscilloscope, etc"
)
# backup=()
# options=('!lto' '!debug')
# install=
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
    (
        set -o pipefail
        git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    git -C "${srcdir}/${pkgbase}" clean -dfx
}

package() {
    cd "${srcdir}/${pkgname}/"
    install -vDm0644 encoderABZ/*.py -t ${pkgdir}/usr/share/libsigrokdecode4DSL/decoders/encoderABZ
    install -vDm0644 *.md -t ${pkgdir}/usr/share/doc/${pkgname}/
    install -vDm0644 LICENSE* -t ${pkgdir}/usr/share/licenses/${pkgname}/
}
