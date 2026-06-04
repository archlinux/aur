# Maintainer: vendiOS <layoguerrero@gmail.com>
pkgname=vendi-git
_pkgname=vendi
pkgver=r1
pkgrel=1
pkgdesc="vendiOS CLI, installer, and supporting libraries (git)"
arch=('any')
url="https://github.com/VendavalSC/vendiOS"
license=('MIT')
depends=(
    'bash'
    'coreutils'
    'util-linux'        # lsblk
    'parted'
    'dosfstools'        # mkfs.fat
    'e2fsprogs'         # mkfs.ext4
    'btrfs-progs'       # mkfs.btrfs (optional but commonly needed)
    'arch-install-scripts'  # pacstrap, arch-chroot, genfstab
    'limine'
    'efibootmgr'
    'reflector'
    'fastfetch'
)
makedepends=('git')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "${_pkgname}"

    # CLIs
    install -Dm755 archiso/airootfs/usr/bin/vendi          "${pkgdir}/usr/bin/vendi"
    install -Dm755 archiso/airootfs/usr/bin/vendi-install  "${pkgdir}/usr/bin/vendi-install"
    install -Dm755 archiso/airootfs/usr/bin/vendi-boot     "${pkgdir}/usr/bin/vendi-boot"
    install -Dm755 archiso/airootfs/usr/bin/vendi-welcome  "${pkgdir}/usr/bin/vendi-welcome"

    # libraries
    install -Dm644 archiso/airootfs/usr/lib/vendi/ui.sh     "${pkgdir}/usr/lib/vendi/ui.sh"
    install -Dm644 archiso/airootfs/usr/lib/vendi/disk.sh   "${pkgdir}/usr/lib/vendi/disk.sh"
    install -Dm644 archiso/airootfs/usr/lib/vendi/system.sh "${pkgdir}/usr/lib/vendi/system.sh"

    # branding
    install -Dm644 archiso/airootfs/usr/share/vendios/logo.txt \
        "${pkgdir}/usr/share/vendios/logo.txt"
}
