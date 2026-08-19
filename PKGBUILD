# Maintainer: Reyshyram <reyshyram@gmail.com>
# Contributor: Inkurey22 <inkurey22.tr@proton.me>

pkgname=epiclang-bin
_pkgname=epiclang
pkgver=20260803220850
pkgrel=1
pkgdesc="Script to call clang with Epitech's C style checking extension"
arch=('x86_64')
url="https://launchpad.net/~epitech/+archive/ubuntu/ppa"
license=('GPL2')
depends=('clang20' 'python' 'banana-coding-style-checker')
makedepends=('binutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

sha256sums=('3471e0f02dde024881a22e4ed4948c3662966a344af9d11979eca8fe92a68bed')

source=("${_pkgname}-${pkgver}.deb::https://ppa.launchpadcontent.net/epitech/ppa/ubuntu/pool/main/e/epiclang/epiclang_${pkgver}_amd64.deb")

package () {
    ar x "${srcdir}/${_pkgname}-${pkgver}.deb" --output "${srcdir}"
    tar xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    sed -i 's/clang-20/\/usr\/lib\/llvm20\/bin\/clang/g' "$pkgdir/usr/bin/epiclang.py"
    sed -i 's/python3.13/python3.14 python3.13/g' "$pkgdir/usr/bin/epiclang"
    chmod +x "$pkgdir/usr/bin/epiclang"

    # cleanup temporary files extracted from the .deb
    rm -f "${srcdir}/${_pkgname}-${pkgver}.deb"
    rm -f "${srcdir}/data.tar.zst" "${srcdir}/control.tar.*" "${srcdir}/debian-binary"
}
