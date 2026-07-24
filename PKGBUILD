# Maintainer: edwloef

pkgname=flow-control-nightly-bin
_pkgname=flow-control
__pkgname=flow
# for new nightly builds update the line below with:
#   PKGVER=${VERSION#v}; sed -i "s/^pkgver=.*/pkgver=${PKGVER//-/.}/" PKGBUILD
# where VERSION is the upstream nightly build tag
pkgver=0.7.2.939.g6c1ac077
pkgrel=1
pkgdesc="a programmer's text editor"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/neurocyte/$__pkgname"
license=('MIT')
optdepends=('ripgrep: project-wide search')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
validpgpkeys=('4E6CF7234FFC4E14531074F98EB1E1BB660E3FB9')

_tag="v$(echo "$pkgver" | sed 's/\.\([0-9]*\)\.g/-\1-g/')"

_arch_map() {
    case "$CARCH" in
        x86_64)  echo "linux-x86_64"  ;;
        i686)    echo "linux-x86"     ;;
        aarch64) echo "linux-aarch64" ;;
        armv7h)  echo "linux-arm"     ;;
    esac
}

_tarball() {
    echo "flow-${_tag}-$(_arch_map)-debug.tar.gz"
}

source=(
    "https://github.com/neurocyte/flow-nightly/releases/download/${_tag}/flow-${_tag}-$(_arch_map)-debug.tar.gz"
    "https://github.com/neurocyte/flow-nightly/releases/download/${_tag}/flow-${_tag}-$(_arch_map)-debug.tar.gz.sig"
)
sha256sums=('SKIP' 'SKIP')

package() {
    tar -xf "$(_tarball)"
    install -Dm755 "${__pkgname}" "${pkgdir}/usr/bin/${__pkgname}"
    install -Dm755 "${__pkgname}-gui" "${pkgdir}/usr/bin/${__pkgname}-gui"
}
