# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=growlight
pkgver=1.0.6.1
pkgrel=3
pkgdesc="Disk manipulation and system preparation tool"
url="https://nick-black.com/dankwiki/index.php/Growlight"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# The same goes for device-mapper.
depends=('cryptsetup' 'libatasmart' 'libpciaccess' 'pciutils')
makedepends=('docbook-xsl' 'autoconf-archive' 'libxslt' 'autoconf')
optdepends=('jfsutils: JFS manipulation'
            'xfsprogs: XFS manipulation'
            'mdadm: Linux MDRAID manipulation'
            'btrfs-progs: Btrfs manipulation'
            'hfsprogs: HFS (MacOS) manipulation'
            'ntfs-3g: NTFS (Windows) manipulation'
            'f2fs-tools: F2FS manipulation')
source=("https://github.com/dankamongmen/growlight/archive/v${pkgver}.tar.gz")

build() {
  cd "$pkgname-$pkgver"
  autoreconf -fis
  ./configure --prefix=/usr --with-ncurses
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

sha256sums=('0cb6adbc63445a2677a1b0e5a5cc48f1b55da2cb79f8f6a9a58cd63f3d5d89cd')
