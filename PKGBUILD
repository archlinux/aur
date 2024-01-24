# Maintainer: taotieren <admin@taotieren.com>

pkgbase=rkbin-git
pkgname=rkbin
pkgver=r1714.b4558da
pkgrel=14
epoch=
pkgdesc="Rockchip Firmware and Tool Binarys"
arch=('x86_64')
url="https://github.com/rockchip-linux/rkbin"
license=('Commercial')
groups=()
depends=('libusb')
makedepends=('git')
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}::git+${url}.git")
noextract=()
sha256sums=('SKIP')
#validpgpkeys=()

pkgver() {
    cd "${srcdir}/${pkgname}/"
#     git describe --long --tags | sed 's/v//g;s/\([^-]*-g\)/r\1/;s/-/./g'
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C "${srcdir}/${pkgname}" clean -dfx
}

package() {

    install -dm0755 "${pkgdir}/opt/rockchip/"

    cp -r ${srcdir}/${pkgname} "${pkgdir}/opt/rockchip/"
    rm -rf ${pkgdir}/opt/rockchip/${pkgname}/.*

    install -Dm0644 /dev/stdin "${pkgdir}/etc/profile.d/${pkgname}.csh" << EOF
setenv PATH "${PATH}:/opt/rockchip/${pkgname}/tools/"
EOF
}
