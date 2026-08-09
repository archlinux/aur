# Maintainer: Ketchup901 <ketchup901@riseup.net>

pkgname=handle-client-bin
pkgver=9.3.2
pkgrel=1
pkgdesc="HDL Client Library from the Handle.Net Registry"
arch=('any')
url="https://handle.net/client_download.html"
license=('custom:HNR-9-CL-Java-License AND Apache-2.0')
depends=('java-runtime>=8')
source=("https://www.handle.net/hnr-source/handle-client-$pkgver-distribution.tar.gz")
sha256sums=('1fb414d97bc9e1eebc5b39dcec0d1a03c373e84500b740f4d7e2d34f170d5cd2')

package() {
    _srcdir=$srcdir/handle-client-$pkgver
    _binaries=$(find $_srcdir/bin/ -type f ! -name '*.bat' -printf '%f\n')
    install -d $pkgdir/opt/handle-client/bin/
    install -d $pkgdir/usr/bin/
    for _binary in $_binaries; do
        install $_srcdir/bin/$_binary -t $pkgdir/opt/handle-client/bin/
        ln -s "/opt/handle-client/bin/$_binary" "$pkgdir/usr/bin/$_binary"
    done

    install -D $_srcdir/lib/* -t $pkgdir/opt/handle-client/lib/

    install -d $pkgdir/opt/handle-client/doc/
    cp -R $_srcdir/doc/ $pkgdir/opt/handle-client/doc/


    install -Dm644 $_srcdir/LICENSE.txt -t $pkgdir/usr/share/licenses/$pkgname/
}
