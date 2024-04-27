# Maintainer: Ryan Barillos < ryan dot barillos at proton dot me >

# Custom variables
_name="acer-wmi-battery"
_user="Diman119"
_ver=1.0
_revision=13
_commit="da45c71"

# Main info
pkgname="$_name-dkms-git"
pkgver="r${_revision}.${_commit}"
pkgrel=2
pkgdesc="For Acer laptops -- kernel module to set Battery Charge Limit to 80%."
arch=('any')
url="https://github.com/${_user}/${_name}"
license=('GPL-2.0')
groups=('acer')
depends=("dkms")
makedepends=("git")
conflicts=("${_name}" "${_name}-dkms")
install="${_name}.install"
source=("git+https://github.com/${_user}/${_name}.git")
sha256sums=("SKIP")


package() {
    # Create directories
    install -dm755 ${pkgdir}/usr/src/"${_name}-${_ver}"
    install -dm755 ${pkgdir}/etc/modules-load.d

    # Copy everything to the new directory
    cp -r ${srcdir}/${_name}/* ${pkgdir}/usr/src/"${_name}-${_ver}"

    # Copy module config to "modules-load.d"
    cp "${srcdir}/${_name}/acer-wmi-battery.conf" "${pkgdir}/etc/modules-load.d"
}