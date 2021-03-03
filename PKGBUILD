# Maintainer: Sam L. Yes <samlukeyes123 at gmail dot com>

pkgname=surface-uefi-firmware-git
_repo=surface-uefi-firmware
pkgver=r11.ad1a6ae
pkgrel=1
pkgdesc="Scripts to prepare UEFI firmware updates for Microsoft Surface"
arch=('any')
url="https://github.com/linux-surface/surface-uefi-firmware"
license=('unknown')
makedepends=('git')
depends=(gcab msitools dos2unix)
optdepends=()
provides=('surface-uefi-firmware')
source=("git+${url}.git")
md5sums=(SKIP)

prepare() {
    sed -i "s/DIR=\$(readlink -f \$(dirname \$0))/DIR=\/usr\/share\/$_repo/" ${srcdir}/$_repo/repack.sh
}

pkgver() {
    cd ${srcdir}/$_repo
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd ${srcdir}/$_repo
    install -d ${pkgdir}/usr/{bin,share/$_repo}
    install -m755 prep.sh ${pkgdir}/usr/bin/surface-firmware-prep
    install -m755 repack.sh ${pkgdir}/usr/bin/surface-firmware-repack
    install -m644 template.metainfo.xml ${pkgdir}/usr/share/$_repo
}