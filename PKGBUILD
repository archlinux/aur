#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=5.0.1
pkgrel=3
pkgdesc='Nutstore integration for Nautilus.'
arch=(x86_64)
url='https://www.jianguoyun.com/'
license=(CCPL:by-nd GPL2)
depends=(libnautilus-extension nutstore)
source=("https://www.jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")
sha256sums=('a4acbc6cff0b71d047d10a31d6fe1eb4e4a42f48b3f96110a2ed44ae2b5a3edc')

build() {
    cd $srcdir/nutstore_linux_src_installer
    ./configure || return 1
    make || return 1
}

package() {
    cd $srcdir/nutstore_linux_src_installer
    make DESTDIR=$pkgdir install
    install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
    rm -rf $pkgdir/usr/share/icons/hicolor/64x64/apps/
}
