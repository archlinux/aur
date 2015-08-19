# Maintainer: 3ED_0 <krzysztof1987 @ gmail.com>
# Contributor: TDY <tdy@archlinux.info>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=disksearch
pkgver=1.2.1
pkgrel=5
pkgdesc="is a tool for searching for files on removable media disks (e.g. for songs on your MP3-CD's)"
arch=('any')
url="http://www.saring.de/disksearch/"
license=('GPL')
depends=('pygtk')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.gz"
        "10-Makefile_small_tweakfix.patch"
        "11-disksearch_bin_script_paths_fix.patch"
        "disksearch.desktop")
noextract=()
sha256sums=('58711b617382582ad59d9d3ccf95d9a6eb9b620237455b4e586a6efa387258d7'
            '3d698b3eb7c18af4f9f045fb23246569608bcab8d2567c87629f693120a9e71b'
            'c611e37f5804f35cc26f2a14ec34fe630c0e26d6735e649ac57e54bb45fb76cb'
            '8a8cdabb4d20da1610ca7b762b99883ff4f17a6e9ffd1498859ff25d708915ae')
prepare() {
  cd "$pkgname-$pkgver"
  patch -Np0 -i "$srcdir/10-Makefile_small_tweakfix.patch"
  patch -Np0 -i "$srcdir/11-disksearch_bin_script_paths_fix.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install

  # icon
  install -Dm644 \
    "resource/$pkgname.png" \
    "$pkgdir/usr/share/pixmaps/$pkgname.png"
  # desktop file
  install -Dm644 \
    "$srcdir/$pkgname.desktop" \
    "$pkgdir/usr/share/applications/$pkgname.desktop"
}
