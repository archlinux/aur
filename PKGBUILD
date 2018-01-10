# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=mkosi-git
pkgver=3.r101.g2f27372
pkgrel=1
pkgdesc='Build Legacy-Free OS Images'
arch=('any')
url='https://github.com/systemd/mkosi'
license=('LGPL2.1')
depends=('python')
makedepends=('python-setuptools')
optdepends=('dnf: build Fedora images'
            'debootstrap: build Debian or Ubuntu images'
            'arch-install-scripts: build Arch images'
            'zypper-git: build openSUSE images'
            'gnupg: sign images'
            'xz: compress images with xz'
            'btrfs-progs: raw_btrfs and subvolume output formats'
            'dosfstools: build bootable images'
            'squashfs-tools: raw_squashfs output format'
            'tar: tar output format'
            'cryptsetup: add dm-verity partitions'
            'ovmf: run bootable images in QEMU'
            'sbsigntools: sign EFI binaries for UEFI SecureBoot')
provides=('mkosi')
conflicts=('mkosi')
source=('git://github.com/systemd/mkosi.git')
md5sums=('SKIP')

pkgver() {
  cd 'mkosi'

  git describe --long | sed '
    # v3-90-gd927f65 (tag - number of commits - g(it)hash)
    s/^v//
    # 3-90-gd927f65
    s/\([^-]*-g\)/r\1/
    # 3-r90-gd927f65
    s/-/./g
    # 3.r90.gd927f65
'
}

package() {
  cd 'mkosi'

  python setup.py install --root="$pkgdir"
}
