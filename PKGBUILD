# Maintainer: Freedownloadmanager Team <support@freedownloadmanager.org>
# Contributor: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=freedownloadmanager
pkgver=6.26.1.6177
pkgrel=2
pkgdesc="FDM is a powerful modern download accelerator and organizer."
arch=('x86_64')
url="https://www.freedownloadmanager.org/"
license=('Freeware')
depends=('openssl' 'xdg-utils' 'ffmpeg' 'libtorrent' 'gst-plugins-base')
# source=("${pkgname}-${pkgver}-amd64.deb::http://debrepo.freedownloadmanager.org/pool/main/f/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
source=("https://files2.freedownloadmanager.org/6/latest/freedownloadmanager.deb")
sha256sums=("ca3c9107fe2f9d55c1f199a2719c6cac4342094b69edb451d18639c7426d9938")

prepare() {
    mkdir -p "$pkgname-$pkgver"
    tar -xvf data.tar.xz -C "$pkgname-$pkgver"
    # tar --use-compress-program=unzstd -xvf data.tar.zst -C "$pkgname-$pkgver"
}

package() {
    cd "$pkgname-$pkgver"

    sed -i 's/\/opt\/freedownloadmanager\/icon\.png/freedownloadmanager/g' \
        './usr/share/applications/freedownloadmanager.desktop'
    sed -i 's/\/opt\/freedownloadmanager\/fdm/\/usr\/bin\/fdm/g' \
        './usr/share/applications/freedownloadmanager.desktop'

    # Add StartupWMClass
    sed -i '/^Exec=/a StartupWMClass=fdm' \
        './usr/share/applications/freedownloadmanager.desktop'

    cp -dpr --no-preserve=ownership opt usr "$pkgdir"

    install -d "$pkgdir/usr/bin"
    ln -sv "/opt/$pkgname/fdm" "$pkgdir/usr/bin/fdm"
}
