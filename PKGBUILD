# Maintainer: Can Celasun <can[at]dcc[dot]im>
pkgname=writerscafe
pkgver=2.42
pkgrel=1
pkgdesc="A set of power tools for all fiction writers, whether experienced or just starting out"
url="http://writerscafe.co.uk/"
license=("custom")
arch=('i686' 'x86_64')
depends=('libpng12' 'gtk2' 'libsm')
source_x86_64=(http://writerscafe.co.uk/WritersCafe-${pkgver}-x86_64.tar.gz)
source_i686=(http://writerscafe.co.uk/WritersCafe-${pkgver}-i386.tar.gz)
md5sums_i686=('5cb5a833a83448668e89047c47b4dd6a')
md5sums_x86_64=('10d2439f045622223d8b16b98ab185aa')

package() {
    cd "$srcdir"
    tar -xzf WritersCafeData.tar.gz
    
    rm -f WritersCafeData.tar.gz
    if [ "${CARCH}" = "x86_64" ]; then
        rm -f WritersCafe-${pkgver}-x86_64.tar.gz
    fi
    if [ "${CARCH}" = "i686" ]; then
        rm -f WritersCafe-${pkgver}-i386.tar.gz
    fi
    
    install -dm755 "${pkgdir}"/usr/share/writerscafe2
    cp -R * "${pkgdir}"/usr/share/writerscafe2
    
    mkdir -p "${pkgdir}"/usr/bin
    mkdir -p "${pkgdir}"/usr/share/applications
    mkdir -p "${pkgdir}"/usr/share/pixmaps
    
    cp "${pkgdir}"/usr/share/writerscafe2/writerscafe2.desktop "${pkgdir}"/usr/share/applications/writerscafe2.desktop
    cp "${pkgdir}"/usr/share/writerscafe2/appicons/writerscafe128x128.png "${pkgdir}"/usr/share/pixmaps/writerscafe2.png
    
    ln -s /usr/share/writerscafe2/writerscafe "${pkgdir}"/usr/bin/writerscafe2
}
