# Maintainer: trumpetrespas <Please comment on the package to contact me>
_pkgbase=wacom_serial5
pkgname=wacom_serial5-dkms-git
pkgver=r54.fa40952
pkgrel=1
pkgdesc="A driver for old serial Wacom protocol V tablets (Intuos and Intuos2)"
arch=(x86_64)
url="https://github.com/RoaldFre/wacom_serial5"
license=('GPL')
groups=()
depends=(dkms)
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
replaces=()
backup=()
options=()
install=
source=('wacom_serial5-dkms-git::git+https://github.com/RoaldFre/wacom_serial5.git'
        'dkms.conf')
noextract=()
md5sums=('SKIP'
         '0bd383adb871aa721a8772565f84c7f3')

pkgver() {
	cd "$srcdir/${pkgname%-VCS}"
# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-VCS}"
# Replace uname with a custom enviroment vairiable set in dkms.conf
    sed -e "s/\$(shell uname -r)/\${KERN_VER}/g" \
        -i ./Makefile
}

build() {
	cd "$srcdir/${pkgname%-VCS}"
}

check() {
	cd "$srcdir/${pkgname%-VCS}"
}

package() {
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
	cd "$srcdir/${pkgname%-VCS}"
    ls ${srcdir}/${pkgname%-VCS}
      # Set name and version
    sed -e "s/@_PKGBASE@/${_pkgbase}/" \
        -e "s/@PKGVER@/${pkgver}/" \
        -i "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf
    install -Dv `ls ${srcdir}/${pkgname%-VCS}` -t  ${pkgdir}/usr/src/${_pkgbase}-${pkgver}
    #install -Dv `ls ${srcdir}/${pkgname%-VCS}` -t  ${pkgdir}/usr/src/${_pkgbase}/${pkgver}
}
