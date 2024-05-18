# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.22.0.5714
pkgrel=2
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Freeware')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent' 'gst-plugins-base')
# source=("${pkgname}-${pkgver}-amd64.deb::http://debrepo.freedownloadmanager.org/pool/main/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
source=("https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=("24396d8276ef12ed88a34349e3c3a0db95cd02871cfdd21b579326504fb4810b")

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -xvf data.tar.xz -C "$pkgname-$pkgver"
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
