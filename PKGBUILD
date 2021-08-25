# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

_pkgbase=ipts
pkgname=ipts-uapi-dkms-git
_repo=intel-precise-touch
#_branch=feature/uapi
pkgver=r138.e66f2fe
pkgrel=1
epoch=1
pkgdesc="The kernelspace part of IPTS (Intel Precise Touch & Stylus) for Linux."
arch=('x86_64')
url="https://github.com/linux-surface/${_repo}"
license=('GPL2')
makedepends=('git')
depends=('dkms')
optdepends=('iptsd: Userspace support')
#conflicts=("${_pkgbase}")
#install=${pkgname}.install
provides=('ipts-uapi-dkms' 'ipts-uapi')
#source=("git+${url}.git#branch=${_branch}")
source=("git+${url}.git")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/${_repo}
    #git log --pretty=format:%at -1
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/$_repo
    sed -i "s/PACKAGE_VERSION=[0-9\"-]*/PACKAGE_VERSION=\"$pkgver\"/" dkms.conf

    # Copy sources (including Makefile)
    install -d "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
    cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/
}
