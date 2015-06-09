# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=szstools
pkgver=1.0
pkgrel=1
pkgdesc="Extract data from gcm and szs files. Contains gcmdump, yaz0dec, and rarcdump"
arch=(i686 x86_64)
url="http://www.amnoid.de/gc/"
license=(GPL)
source=('http://www.amnoid.de/gc/szstools.zip'
        0001-Fixes-to-build-with-GNU-g.patch)
sha512sums=('c75bf30f39291687242be89cbf6f33a82fb6d152c05089066065b8324763ff6314116306c6df557fa072e1c1311bf566318c658de32f4ce195eee89b8cc640bd'
            '1c490764742268d5fe7559b9dea929b08b26488648d620989c3cb9208e2d7b895b7cd64b5aa55e581ac286bb319e9aa499c741b651fe2c0abf3c07a0fcf7987b')

prepare() {
    patch -p1 -i 0001-Fixes-to-build-with-GNU-g.patch
}

build() {
    # Compile yaz0dec
    g++ yaz0dec.cpp -o yaz0dec

    # Compile rarcdump
    g++ rarcdump.cpp -o rarcdump

    # Compile gcmdump
    g++ gcmdump.cpp -o gcmdump
}

package() {
    # Install yaz0dec
    install -Dm755 yaz0dec "${pkgdir}/usr/bin/yaz0dec"

    # Install rarcdump
    install -Dm755 rarcdump "${pkgdir}/usr/bin/rarcdump"

    # Install gdmdump
    install -Dm755 gcmdump "${pkgdir}/usr/bin/gcmdump"
}
