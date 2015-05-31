# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=writerscafe
pkgver=2.37
pkgrel=2
pkgdesc="A set of power tools for all fiction writers, whether experienced or just starting out"
url="http://writerscafe.co.uk/"
license="custom"
arch=(i686 x86_64)
depends=('libpng12')
install=writerscafe.install

if [ "${CARCH}" = "x86_64" ]; then
source=(http://writerscafe.co.uk/WritersCafe-${pkgver}-x86_64.tar.gz)
md5sums=('e6104ea968706aae14f2a2886b28e43f')
fi
if [ "${CARCH}" = "i686" ]; then
source=(http://writerscafe.co.uk/WritersCafe-${pkgver}-i386.tar.gz)
md5sums=('1d0ab1da5c1ac9eb7595405e9d9f1e87')
fi

package() {

    cd $srcdir
    tar -xzf WritersCafeData.tar.gz
    
    msg "Cleaning files"
    rm -f WritersCafeData.tar.gz
    if [ "${CARCH}" = "x86_64" ]; then
        rm -f WritersCafe-${pkgver}-x86_64.tar.gz
    fi
    if [ "${CARCH}" = "i686" ]; then
        rm -f WritersCafe-${pkgver}-i386.tar.gz
    fi
    
    msg "Copying files"
    install -dm755 $pkgdir/usr/share/writerscafe2
    cp -R * $pkgdir/usr/share/writerscafe2
    mkdir -p $pkgdir/usr/bin
    
    msg "Creating desktop file"
    mkdir -p $pkgdir/usr/share/applications
    cp $pkgdir/usr/share/writerscafe2/writerscafe2.desktop $pkgdir/usr/share/applications
    
    msg "Creating icons"
    mkdir -p $pkgdir/usr/share/pixmaps
    cp $pkgdir/usr/share/writerscafe2/appicons/writerscafe128x128.png $pkgdir/usr/share/pixmaps/writerscafe2.png
}
