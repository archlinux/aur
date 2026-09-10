# Maintainer: Reyshyram <reyshyram@gmail.com>
# Contributor: Inkurey22 <inkurey22.tr@proton.me>

pkgname=epiclang-bin
_pkgname=epiclang
pkgver=20260908135112
pkgrel=1
pkgdesc="Script to call clang with Epitech's C style checking extension"
arch=('x86_64')
url="https://launchpad.net/~epitech/+archive/ubuntu/ppa"
license=('GPL2')
depends=('clang21' 'python' 'banana-coding-style-checker')
makedepends=('binutils')
provides=("$_pkgname")
conflicts=("$_pkgname")

sha256sums=('743ae303b2cf4304fe7803906ffaa48ad93df1f9790df7f6ad2274a4543caa22')

source=("${_pkgname}-${pkgver}.deb::https://ppa.launchpadcontent.net/epitech/ppa/ubuntu/pool/main/e/epiclang/epiclang_${pkgver}_amd64.deb")

package () {
    ar x "${srcdir}/${_pkgname}-${pkgver}.deb" --output "${srcdir}"
    tar xf "${srcdir}/data.tar.zst" -C "${pkgdir}"

    sed -i 's/clang-21/\/usr\/lib\/llvm21\/bin\/clang/g' "$pkgdir/usr/bin/epiclang.py"
    chmod +x "$pkgdir/usr/bin/epiclang"

    # cleanup temporary files extracted from the .deb
    rm -f "${srcdir}/${_pkgname}-${pkgver}.deb"
    rm -f "${srcdir}/data.tar.zst" "${srcdir}/control.tar.*" "${srcdir}/debian-binary"
}
