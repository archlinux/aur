# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=torrentzip
pkgver=0.2
pkgrel=1
pkgdesc="Efficient way to prepare Zip files for BitTorrent"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/trrntzip/"
license=('GPL2')
source=("https://sourceforge.net/projects/trrntzip/files/trrntzip/TorrentZip%20v0.2/trrntzip_v02_src.tar.gz"
         permissions-fix.patch)
sha512sums=('802dd1bf55e0a31df75d8195c9d2d5610be8cb7f14d14278eba72b580aff3ad415711999db05a5425303380ebfc82a68896e276319e0ead5635d0a07615ba700'
            'db876bf7d01345699862dd7b37ddd899d19029542e69c36c718403bbc312422c64a5a723875fdccd5604b4b26331638c1c254f005a8b9dcc627cc519a27171b9')

prepare() {
  cd trrntzip

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  autoreconf -fi
}

build() {
  cd trrntzip
  ./configure --prefix=/usr
  make
}

package() {
  cd trrntzip
  make DESTDIR="$pkgdir/" install
  ln -s trrntzip "$pkgdir"/usr/bin/torrentzip
}
