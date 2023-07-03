# Maintainer: shadichy <shadichy.dev@gmail.com>
pkgbase=systemback-efiboot
pkgname=$pkgbase
pkgver=0.0.4
pkgrel=1
pkgdesc='Boot files for Systemback'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
march=""
url='https://github.com/shadichy/systemback-archlinux'
license=('GPL')
depends=('libisoburn' 'syslinux')
optdepends=('cdrtools')
makedepends=('grub' tar 'libarchive')
# source=()
# md5sums=('SKIP')

build() {
    cd ${srcdir}
    grub-mkrescue -V "SBROOT" -o "grub.iso" --modules="part_msdos part_gpt part_apple fat exfat iso9660 hfs hfsplus ntfs crypto gzio zstd xzio lzopio" --themes=
    bsdtar -xf grub.iso
    rm -f grub.iso
    tar --zstd -cf efi.bootfiles ./*
}

package() {
    mkdir -p ${pkgdir}/usr/share/${sb}
    install -dm644 ${pkgdir}/usr/share/${sb}
    install -m644 ${srcdir}/efi.bootfiles ${pkgdir}/usr/share/${sb}
}
