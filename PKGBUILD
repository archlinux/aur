#Maintainer: Bhoppi Chaw <bhoppi#outlook,com>

pkgname=nautilus-nutstore
pkgver=3.1.0
pkgrel=1
pkgdesc='Nutstore integration for Nautilus.'
arch=(x86_64 i686)
url='https://jianguoyun.com/'
license=(CCPL:by-nd GPL2)
depends=(libnautilus-extension)
optdepends=('nutstore: Nutstore client (system-wide)'
            'gtk2: per-user Nutstore depend'
            'java-runtime: per-user Nutstore depend'
            'python2-notify: per-user Nutstore depend')
install='nautilus-nutstore.install'
source=("https://jianguoyun.com/static/exe/installer/nutstore_linux_src_installer.tar.gz")

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
md5sums=('5d2afc990450b7a8e1839a664e351944')
