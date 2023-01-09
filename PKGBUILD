# Maintainer: Pellegrino Prevete <pellegrinoprevete@gmail.com>

# shellcheck disable=SC2034
_arch="mips"
_platform="ps2"
_iop="${_arch}el-${_platform}"
_ee="${_arch}64r5900el-${_platform}-elf"
_base="sdk"
_ns="${_platform}${_base}"
_pkgbase="${_platform}${_base}-ports"
_pkg="mad"
pkgname="${_pkg}play"
pkgver="0.15.2b"
pkgrel=1
_pkgdesc=("Front-end for libmad.")
pkgdesc="${_pkgdesc[*]}"
arch=('x86_64')
license=('GPL')
_ns="${_platform}${_base}"
url="https://sourceforge.net/projects/${_pkg}"
_local="ssh://git@127.0.0.1:/home/git"
_url="${url}/files/${pkgname}/${pkgver}/${pkgname}-0.15.2b.tar.gz"
depends=("lib${_pkg}")
makedepends=("libid3tag")
optdepends=()
source=("${pkgname}.tar.gz::${_url}")
_commit="e2d60dcfc4db404bf7426312239d8df8b2f2c9e3"
# source=("${pkgname}::git+${_local}/${pkgname}#commit=${_commit}")
sha512sums=('0e79cdf0c32f48599083ec7a0716d816e3f03254705b7225b1ea9008d53eefd48342dd687b0507f0ff15942218fc07ad1e38c4172508c27755f3e9a0e5412f34')

build() {
    local opts=(--prefix="/usr"
                --mandir="/usr/share/man")

    cd "${srcdir}/${pkgname}-${pkgver}"
    "./configure" ${opts[@]}
    make
}

# shellcheck disable=SC2154
package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
