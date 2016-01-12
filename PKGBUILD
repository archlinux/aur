# Maintainer: Can Celasun <dcelasun[at]gmail[dot]com>
pkgname=writerscafe
pkgver=2.39
pkgrel=1
pkgdesc="A set of power tools for all fiction writers, whether experienced or just starting out"
url="http://writerscafe.co.uk/"
license="custom"
arch=('i686' 'x86_64')
depends=('libpng12')
install=writerscafe.install
source_x86_64=(http://writerscafe.co.uk/WritersCafe-${pkgver}-x86_64.tar.gz)
source_i686=(http://writerscafe.co.uk/WritersCafe-${pkgver}-i386.tar.gz)
md5sums_i686=('86c3ea90c51a78f381ff346f6db795d2')
md5sums_x86_64=('c075b3a95da870307dbd102676b20416')

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
