# Maintainer: taotieren <admin@taotieren.com>

pkgbase=can-doc-git
pkgname=can-doc-git
pkgver=r9.9f10695
pkgrel=1
groups=()
pkgdesc="Linux-CAN / SocketCAN documentation"
arch=(any)
url="https://github.com/linux-can/can-doc"
license=('unkown')
provides=(${pkgname%-git})
conflicts=(${pkgname%-git})
depends=()
makedepends=(git)
optdepends=("can-utils: Linux-CAN / SocketCAN user space applications"
    "can-isotp-dkms: Kernel modules for isotp")
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname}"
#     git describe --long --tags | sed 's/^v//g' | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {
    install -dm0755 "${pkgdir}/usr/share/doc/${pkgname%-git}"

    cd "${srcdir}/${pkgname}"/
    rm -rf .*
    cp -rv * "${pkgdir}/usr/share/doc/${pkgname%-git}/"
}
