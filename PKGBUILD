# Maintainer: Marco Huenseler <marco@wuthoehle.de>

pkgname='shim-fedora'
_pkgname='shim'
_vendor='arch'
pkgver='16.1'
_upstream_pkgrel='5'
_downstream_pkgrel='1'
pkgrel="${_upstream_pkgrel}.${_downstream_pkgrel}"
pkgdesc='Initial UEFI bootloader that handles chaining to a trusted full bootloader under secure boot environments (prebuilt x64 binaries from Fedora). Target directory structure matches bootupd expectations.'
url='https://packages.fedoraproject.org/pkgs/shim/shim-x64'
arch=('x86_64')
license=('BSD-3-Clause')
options=('!strip' '!debug')
provides=("shim=$pkgver")
optdepends=('mokutil: Manage Machine Owner Keys (MOK)')
source=("https://kojipkgs.fedoraproject.org/packages/${_pkgname}/${pkgver}/${_upstream_pkgrel}/x86_64/${_pkgname}-x64-${pkgver}-${_upstream_pkgrel}.x86_64.rpm")
sha256sums=('cb0289fb3d8356fe30dbf2a5a8c0cd9ba618df5ff54cf49887f75f2feb3f61c7')

package() {
    local verdir="${pkgver}-${_upstream_pkgrel}"
    local srcbase="${srcdir}/usr/lib/efi/shim/${verdir}"
    local dstbase="${pkgdir}/usr/lib/efi/shim/${verdir}"

    local f
    for f in \
        "EFI/BOOT/BOOTX64.EFI" \
        "EFI/BOOT/fbx64.efi" \
        "EFI/fedora/BOOTX64.CSV" \
        "EFI/fedora/mmx64.efi" \
        "EFI/fedora/shim.efi" \
        "EFI/fedora/shimx64.efi"; do
        install -Dm0644 "${srcbase}/${f}" "${dstbase}/${f/fedora/${_vendor}}"
    done
}
