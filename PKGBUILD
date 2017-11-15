# Maintainer: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Unknown47 <unknown47r@gmail.com>
# Contributor: Angel Velasquez <angvp@archlinux.org>
# Contributor: Juergen Hoetzel <juergen@archlinux.org>

pkgname=pcmanfm-gtk3
_pkgname=pcmanfm
pkgver=1.2.5
pkgrel=2
pkgdesc='Extremely fast and lightweight file manager (GTK+ 3 version)'
arch=('x86_64')
url='http://pcmanfm.sourceforge.net/'
license=('GPL')
groups=('lxde-gtk3')
depends=('libfm-gtk3' 'lxmenu-data')
makedepends=('intltool')
optdepends=('gvfs: for trash support, mounting with udisks and remote filesystems'
            'xarchiver: archive management')
conflicts=($_pkgname)
source=(https://downloads.sourceforge.net/$_pkgname/$_pkgname-$pkgver.tar.xz
        Fix-CVE-2017-8934.patch)
sha256sums=('0c86cac028b705ff314c7464d814c2cf7ff604c17491c20aa204b1ef1a80ad67'
            'b6c72862e70d4c4d2ec9754427bf7835b4f3104fea642e7ba4dd871c782bd1f1')

prepare() {
  cd $_pkgname-$pkgver
  patch -Np1 -i ../Fix-CVE-2017-8934.patch
}

build() {
  cd $_pkgname-$pkgver
  ./configure --sysconfdir=/etc --prefix=/usr --with-gtk=3
  make
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
