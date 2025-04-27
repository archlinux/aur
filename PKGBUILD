# Maintainer: ⭐️NINIKA⭐️ <nikita6@bk.ru>
_build_rev=8cc34f323d01f473be0ee6098ab992d1db1af5f7
_build_num=2
pkgname=revng-bin
pkgver=0.0.0.r2.g8cc34f32
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
sha256sums=('e42962ab4c629e0432ed1870f705793af0e667d91cba175be3c4341caba4eb35'
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
