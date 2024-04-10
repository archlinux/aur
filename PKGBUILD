# Maintainer: ⭐️NINIKA⭐️ <nikita6@bk.ru>
_build_rev=3b3cf7b97706fc264fa4b0aaf6425bfd104619ad
_build_num=1
pkgname=revng-bin
pkgver=0.0.0.r1.g3b3cf7b9
pkgrel=1
pkgdesc="An open source binary analysis framework based on LLVM and QEMU"
arch=('x86_64')
url="https://rev.ng/"
license=('GPL2')
depends=()
makedepends=()
provides=('revng')
source=(
    "https://rev.ng/downloads/revng-distributable/none_${_build_rev}.tar.xz"
    "launcher.sh"
)
sha256sums=('b891c84b791c9e48c0175e10ea49ad7b8d27dac614066d49af180d384019dbfe'
            '4605f93ff27ba081036acebb204af5e81614394357d941ae917e8e97e58d7252')
options=("!strip")

pkgver() {
    echo "0.0.0.r$_build_num.g$(echo "$_build_rev" | cut -c -8)"
}

package() {
    install -d -m755 "${pkgdir}/opt/revng" "${pkgdir}/usr/bin"

    cp -dr --no-preserve='ownership' "${srcdir}/revng-public-demo"/* "${pkgdir}/opt/revng"

    # not using a symlink because the "revng" script gets confused about its location
    install -m755 "${srcdir}/launcher.sh" "${pkgdir}/usr/bin/revng"
}
