# Maintainer: Sam L. Yes <samlukeyes123@gmail.com>

_pkgbase=ipts-uapi
pkgname=ipts-uapi-dkms-git
_repo=intel-precise-touch
_branch=feature/uapi
pkgver=1590862024
pkgrel=1
pkgdesc="The kernelspace part of IPTS (Intel Precise Touch & Stylus) for Linux. \
To make this module work, make sure you applied the patches from the git repo to your kernel \
or you are using the latest linux-surface kernel."
arch=('x86_64')
url="https://github.com/linux-surface/${_repo}"
license=('GPL2')
makedepends=('git')
depends=('dkms')
#conflicts=("${_pkgbase}")
#install=${pkgname}.install
provides=('ipts-uapi-dkms')
source=("git+${url}.git#branch=${_branch}")
md5sums=(SKIP)

pkgver() {
    cd ${srcdir}/${_repo}
    git log --pretty=format:%at -1
}

package() {
    cd ${srcdir}/$_repo

    # Copy dkms.conf
    install -Dm644 dkms.conf "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/dkms.conf

    # Copy sources (including Makefile)
    cp -r * "${pkgdir}"/usr/src/${_pkgbase}-${pkgver}/

}