# Maintainer: gmes78 <gmes.078 at gmail dot com>
pkgname=usbmaker-git
pkgver=1.0.1.r0.60c90f1
pkgrel=1
pkgdesc="Utility to format and make bootable usb drives"
arch=(any)
url="https://github.com/gmes/USBMaker"
license=('GPL')
depends=('python-pyqt5')
makedepends=('python-setuptools' 'git')
optdepends=('parted: partitioning support'
            'cdrtools: ISO label detection'
            'e2fsprogs: Ext4 and badblocks support'
            'dosfstools: FAT support'
            'exfat-utils: exFAT support'
            'ntfs-3g: NTFS support'
            'udftools: UDF support'
            'btrfs-progs: Btrfs support'
            'grub: GRUB2 support'
            'syslinux: SYSLINUX support'
            'systemd: systemd-boot support'
            'grub4dos: GRUB4DOS support')
provides=('usbmaker')
conflicts=('usbmaker')
source=("git+https://github.com/gmes/USBMaker.git"
        'usbmaker.desktop'
        'usbmaker.svg'
        'usbmaker_polkit'
        'usbmaker.pkexec.policy')
sha512sums=('SKIP'
            '0390d0b242952a96b61e576d9ec8dbfa2db5f53443e46d0d646d3be4f9da9245446b423595dbdd290c9787bbd50f728ad5abe47199d975029e68ca30ced91c9a'
            '31c1959750310f2b657c46e0c6b660c720c5fc135bf096845935756126db426d0cd0232b14a58cab057ebee5bf1e707e3680f61d9d398cdde14550b5de498c6b'
            '4c3b6f727ebbc728e0127d487077b7e03497ebcf3781bf52ca982114989d7a05347ffd8a479eeb05851b0cd5ec879f0ce0e9792d79c9d1621382595a87de7ab1'
            '9847ca9775c85b60b023d4fb03ecb4a80286b160d9fdbca0535d58568b06784d5e2c6e7bc649a97c9fafa740f5b6023aa50f6e2f1ca80649c998fbf2792fbd84')

pkgver(){
  cd "$srcdir/USBMaker"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
  cd "$srcdir/USBMaker"

  python setup.py install --root="$pkgdir/" --optimize=1

  mkdir -p "$pkgdir/usr/share/applications"
  install --mode=644 --owner=root --group=root "$srcdir/usbmaker.desktop" "$pkgdir/usr/share/applications/"

  mkdir -p "$pkgdir/usr/share/icons"
  install --mode=644 --owner=root --group=root "$srcdir/usbmaker.svg" "$pkgdir/usr/share/icons/"

  mkdir -p "$pkgdir/usr/bin"
  install --mode=755 --owner=root --group=root "$srcdir/usbmaker_polkit" "$pkgdir/usr/bin/"

  mkdir -p "$pkgdir/usr/share/polkit-1/actions"
  install --mode=644 --owner=root --group=root "$srcdir/usbmaker.pkexec.policy" "$pkgdir/usr/share/polkit-1/actions/"
}
