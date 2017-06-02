#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=3.4.3
pkgrel=2
pkgdesc='Nutstore integration for Nautilus.'
arch=(x86_64 i686)
url='https://jianguoyun.com/'
license=(CCPL:by-nd GPL2)
depends=(libnautilus-extension
         nutstore)
source=("https://jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")
sha256sums=('1fd2cbd0c863b2facb29ca407afe8701202cce168884fca8bcf5916fb56022e8')

build()
{
    cd $srcdir/nutstore_linux_src_installer
    ./configure || return 1
    make || return 1
}

package()
{
    cd $srcdir/nutstore_linux_src_installer
    make DESTDIR=$pkgdir install
    install -D -m 644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
    rm -rf $pkgdir/usr/share/icons/hicolor/64x64/apps/
}
