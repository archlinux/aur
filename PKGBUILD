# Maintainer: Guilherme Calé <gui@cabritacale.eu>
pkgname=fc5025
pkgver=1309
pkgrel=2
pkgdesc="Utilities for FC5025 USB 5.25\" floppy controller by Device Side Data"
arch=('i686' 'x86_64')
url="http://www.deviceside.com/drivers.html"
license=('unknown')
depends=('libusb-compat' 'gtk2')
source=("http://www.deviceside.com/FC5025_Driver_Source_Code_v1309.tar.gz"
        'fc5025.desktop'
        'fc5025.png')
md5sums=('1a80528ea7b90ab4bf7210387d8b2e0a'
         '6b4cc572399100ef1c784f32bf3a8fb9'
         '8a95b61613d3a52d6d2b09f376544209')

build() {
    cd dib
    cd backend
    make all
    cd ..
    cd cmd
    make all
    cd ..
    cd xdib
    make all
}

package() {
    cd dib
    install -D -m755 ./cmd/fcbrowse "$pkgdir/usr/bin/fcbrowse"
    install -D -m644 ./cmd/fcbrowse.1 "$pkgdir/usr/share/man/man1/fcbrowse.1"
    install -D -m755 ./cmd/fcdrives "$pkgdir/usr/bin/fcdrives"
    install -D -m644 ./cmd/fcdrives.1 "$pkgdir/usr/share/man/man1/fcdrives.1"
    install -D -m755 ./cmd/fcformats "$pkgdir/usr/bin/fcformats"
    install -D -m644 ./cmd/fcformats.1 "$pkgdir/usr/share/man/man1/fcformats.1"
    install -D -m755 ./cmd/fcimage "$pkgdir/usr/bin/fcimage"
    install -D -m644 ./cmd/fcimage.1 "$pkgdir/usr/share/man/man1/fcimage.1"
    install -D -m755 ./xdib/xdib "$pkgdir/usr/bin/xdib"
    install -D -m644 ./025_fc5025.rules "$pkgdir/etc/udev/rules.d/025_fc5025.rules"
    cd ..
    install -D -m644 ./fc5025.png "$pkgdir/usr/share/pixmaps/fc5025.png"
    install -Dm644 ./fc5025.desktop "$pkgdir/usr/share/applications/fc5025.desktop"
}
