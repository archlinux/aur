# Maintainer: partcyborg <me@partcyb.org>
# Special thanks to mkubecek for creating the GitHub repository that this sources.

pkgname=vmware-modules-dkms-git
_gitname=vmware-host-modules
pkgver=1.1
pkgrel=4
pkgdesc="VMWare's host kernel modules patched to build against all modern kernels, wrapped up in  a dkms module."
arch=("any")
license=("LGPL")
url="https://github.com/mkubecek/${_gitname}"
options=()
install=${pkgname}.install
makedepends=("dkms" "git")
optdepends=("vmware-workstation: Required, but using the AUR package is optional")
source=(
   "dkms.conf.in"
   "dkms.sh.in"
)
sha256sums=(
   "57984b4a196e78f7ec0c2557c03810c8c3cf6ae393ae725b97b8ebebcb02e6a1"
   "f20b38bc8f5b5687ee273423849abf677b1e153d045480bbbef28c40dd6f6e7c"
)

_var_replace() {
   sed \
      -e "s/%PKGVER%/${pkgver}/" \
      -e "s/%DKMSNAME%/${_gitname}/" \
      "${srcdir}/$1" > "${srcdir}/$2"
}

prepare() {
   _var_replace dkms.conf.in dkms.conf
   _var_replace dkms.sh.in dkms.sh
}


package() {
   install -Dm644 "$srcdir/dkms.conf" "$pkgdir/usr/src/vmware-host-modules-${pkgver}/dkms.conf"
   install -Dm755 "$srcdir/dkms.sh" "$pkgdir/usr/src/vmware-host-modules-${pkgver}/dkms.sh"
}
