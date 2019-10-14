# Maintainer: Nick Black <dankamongmen@gmail.com>

pkgname=growlight
pkgver=1.1.1
pkgrel=2
pkgdesc="Disk manipulation and system preparation tool"
url="https://nick-black.com/dankwiki/index.php/Growlight"
license=('GPL3')
arch=('x86_64')
# ncurses and readline are found without our help. Don't explicitly list them.
# The same goes for device-mapper.
depends=('cryptsetup' 'libatasmart' 'libpciaccess' 'pciutils')
makedepends=('cunit' 'docbook-xsl' 'autoconf-archive' 'libxslt' 'autoconf')
optdepends=('jfsutils: JFS manipulation'
            'xfsprogs: XFS manipulation'
            'mdadm: Linux MDRAID manipulation'
            'btrfs-progs: Btrfs manipulation'
            'hfsprogs: HFS (MacOS) manipulation'
            'ntfs-3g: NTFS (Windows) manipulation'
            'f2fs-tools: F2FS manipulation'
            'hdparm: Deep ATA hardware details'
            'nvme-cli: Deep NVMe hardware details')
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

sha256sums=('13128f26e3b6c3bf20ad64d424c820e57b783684008e7655f69feafd4e9b5938')
