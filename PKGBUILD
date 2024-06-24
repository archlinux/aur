# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.23.0.5754
pkgrel=2
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Freeware')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent' 'gst-plugins-base')
# source=("${pkgname}-${pkgver}-amd64.deb::http://debrepo.freedownloadmanager.org/pool/main/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
source=("https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=("f0c3b0d3f7e666d7d80a42c5c75e0abd0f543681e844ce1fcb91971f97256202")

prepare() {
    mkdir -p "$pkgname-$pkgver"
    # tar -xvf data.tar.xz -C "$pkgname-$pkgver"
    tar --use-compress-program=unzstd -xvf data.tar.zst -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    
    sed -i 's/\/opt\/freedownloadmanager\/icon\.png/freedownloadmanager/g' \
        './usr/share/applications/freedownloadmanager.desktop'
    sed -i 's/\/opt\/freedownloadmanager\/fdm/\/usr\/bin\/fdm/g' \
        './usr/share/applications/freedownloadmanager.desktop'
    
    cp -dpr --no-preserve=ownership opt usr "$pkgdir"
    
    install -d "$pkgdir/usr/bin"
    ln -sv "/opt/$pkgname/fdm" "$pkgdir/usr/bin/fdm"
}
