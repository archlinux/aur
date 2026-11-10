# Maintainer: Fell <fell@fellr.net>

pkgname=plasticscm-client-gui
pkgver=11.0.16.10616
pkgrel=1
pkgdesc="Unity Version Control (formerly Plastic SCM) originally developed by Códice Software (Graphical utilities)"
arch=('x86_64')
url="https://www.plasticscm.com/plastic-for-linux"
license=('LicenseRef-UnityVersionControl')
depends=('e2fsprogs' 'gcc-libs' 'glibc' 'icu' 'keyutils' 'krb5' 'lttng-ust' 'zlib' 'plasticscm-client-core')
groups=('plasticscm-complete' 'plasticscm-client-complete')
options=('!strip') # stripping seems to break the binaries
source=(
    "https://uvcs.unity3d.com/linux/repos/deb/pool/main/u/unity/uvcs_amd64/${pkgname}_${pkgver}-1_amd64.deb"
    "https://uvcs.unity3d.com/linux/repos/deb/pool/main/u/unity/uvcs_amd64/plasticscm-theme_${pkgver}-1_amd64.deb"
)
noextract=("${source[@]##*/}")
b2sums=('2b1d5b3217e28a86b477b8056f91ba7a2fee6abb7ffe592d8b780e718e366f307b7f8df3e8de95f384fccc5035983431f050889a39fd302889037ac6fee4484b'
        '8822233b9a8ed78d34bea5a2f8871ccf1a4da343d683151d0184cb435efcadce6c5573bf8e90c1aaa4c81553a07b4462330960a0f063f5b5a7da9a497ed0f834')

package() {
    local deb
    for deb in "${noextract[@]}"; do
        bsdtar -xOf "${srcdir}/${deb}" data.tar.gz | bsdtar -xf - -C "${pkgdir}"
    done
}
