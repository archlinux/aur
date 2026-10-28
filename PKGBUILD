# Maintainer: 9M2PJU <9m2pju@gmail.com>
pkgname=rufix-git
pkgver=0.3.1.r1.g8191265
pkgrel=1
pkgdesc="Rufus-style USB formatter and bootable drive creator for Linux (GTK3) - git version"
arch=('any')
url="https://github.com/thuutien/rufix"
license=('GPL-3.0-only')
depends=('python' 'python-gobject' 'gtk3' 'polkit'
         'dosfstools' 'e2fsprogs' 'exfatprogs' 'ntfs-3g' 'ntfsprogs'
         'util-linux' 'systemd')
optdepends=('wimlib: split Windows install.wim images larger than 4 GB for FAT32 drives'
            'parted: re-read partition tables via partprobe'
            '7zip: extract 7z and RAR files in Compressed file mode'
            'unrar: extract RAR files in Compressed file mode'
            'libarchive: bsdtar fallback for extracting archives'
            'udisks2: remount the drive after writing so it shows in the file manager')
makedepends=('git')
provides=('rufix')
conflicts=('rufix')
source=("$pkgname::git+https://github.com/thuutien/rufix.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "$pkgname"
  sh install.sh --prefix-root "$pkgdir"
}
