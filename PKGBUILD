# Maintainer: Lucas Werkmeister <mail@lucaswerkmeister.de>
# Contributor: Dave Reisner <dreisner@archlinux.org>

pkgname=mkosi
pkgver=2
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
            'edk2-ovmf: run bootable images in QEMU'
            'sbsigntools: sign EFI binaries for UEFI SecureBoot')
source=("https://github.com/systemd/mkosi/archive/v$pkgver.tar.gz")
sha256sums=('1b1df95a95cd02ed4d2473d7be147da0829e24b5f84cea91995d76dab2f90de6')

package() {
  cd "mkosi-$pkgver"

  # temporarily fix package version, forgotten in v2 release (remove for next release!)
  sed -i '/__version__/ s/1/2/' mkosi
  sed -i '/version/ s/1/2/' setup.py

  python setup.py install --root="$pkgdir"
}
