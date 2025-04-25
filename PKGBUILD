# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: baldosa <ema@guillen.com.ar>

_pkgname="open-vmdk"
_pkgsrc=$_pkgname
pkgname="$_pkgname-git"
pkgver=r191.aa8e764
pkgrel=1
pkgdesc="Open VMDK is an assistant tool for creating Open Virtual Appliance (OVA)."
arch=('x86_64')
url="https://github.com/vmware/open-vmdk"
license=('Apache-2')
depends=()
makedepends=()
provides=("$_pkgname")
conflicts=("$_pkgname")
changelog=
source=("git+$url")
sha256sums=('SKIP')


pkgver() {
	cd "$_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgsrc}"
    echo 
    make
}

package() {
    cd "${srcdir}/${_pkgsrc}"

    DESTDIR="${pkgdir}" make install

    install -Dm644 ${srcdir}/${_pkgsrc}/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}

