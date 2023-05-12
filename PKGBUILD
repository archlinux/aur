# Maintainer:  Luca D'Amico <damico.luca91@live.it>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>

pkgname=tuxpuck
pkgver=0.8.2
pkgrel=12
pkgdesc="Airhockey with tux (Shufflepuck Café clone)"
arch=('i686' 'x86_64')
url="https://wiki.debian.org/Games/TuxPuck"
license=('GPL2')
depends=('libjpeg' 'sdl' 'libpng' 'libvorbis')
makedepends=('freetype2')
options=('!makeflags')
source=("http://ftp.de.debian.org/debian/pool/main/t/${pkgname}/${pkgname}_$pkgver.orig.tar.gz"
        "buffer-overflow.patch"
        "clang-FTBFS.patch"
        "cross.patch"
        "FTBFS-with-fread.patch"
        "libpng-transition.patch"
        "Makefile.patch"
        "install_path.patch"
        "tuxpuck.desktop")
sha256sums=('62d9604ed69c27b9ca2be1312bc705b36de8ed509c539c6d81193e7846272f18'
            '85435a4217f768bc7077afc0b651f180b8de675c67a3910724a59c95012e9293'
            'e9d6221c7c789880316f7b3e78574b40ebb9e953bb88410d7d5e9a3ac0868b6b'
            '93ef7e07638b4dcbae30cda092f8b81df1167c1daafd1aa239ad3cb2ed44c1a0'
            '03ffd5ba4be212371e6b084c36be42531db878b7d89bf20a051462f6473bd17b'
            '0b2244747334a0821d78df9b8fe527e9ff669ea9f817600d1b5a3a4d32839c9b'
            'ccbb2943c25b829c1632562bd8d7aab5b3cdfd25b0697f61b9a373e524182c36'
            '6802e51447313ef46c7152b8ee007ccd42146386fcd0e53457021f8fe2422be3'
            'd07d5a1d3b6278e0794371e3a3baf860fe36ae0b4b220aeaa4175381399a95c3')

prepare() {
  cd $pkgname-$pkgver
  
  # buffer overflow fix patch
  echo "Applying buffer overflow fix patch"
  patch -Np1 < ../buffer-overflow.patch
  # clang FTBFS fix patch
  echo "Applying clang FTBFS fix patch"
  patch -Np1 < ../clang-FTBFS.patch
  # FTBFS with fread fix patch
  echo "Applying FTBFS with fread fix patch"
  patch -Np1 < ../FTBFS-with-fread.patch
  # libpng patch
  echo "Applying libpng patch"
  patch -Np1 < ../libpng-transition.patch
  # Makefile patch
  echo "Applying akefile patch"
  patch -Np1 < ../Makefile.patch
  # cross patch
  echo "Applying cross patch"
  patch -Np1 < ../cross.patch
  # install path patch
  echo "Applying install path patch"
  patch -Np0 < ../install_path.patch
}

build() {
  make -C $pkgname-$pkgver
}

package() {
  make -C $pkgname-$pkgver DESTDIR="$pkgdir/" install
  install -D -m 644 tuxpuck.desktop $pkgdir/usr/share/applications/tuxpuck.desktop
  install -D -m 644 $pkgname-$pkgver/data/icons/tuxpuck.ico $pkgdir/usr/share/pixmaps/tuxpuck.ico
} 
