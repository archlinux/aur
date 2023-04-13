# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.19.0.5156
pkgrel=2
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Freeware')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent')
# source=("${pkgname}-${pkgver}-amd64.deb::http://debrepo.freedownloadmanager.org/pool/main/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
source=("https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=("a937363c821f5be62e4806fccf75697f66d3761ba6a195ce013b01506d846136")

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
