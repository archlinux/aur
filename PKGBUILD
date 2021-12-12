pkgname=powershell-empire
_name=Empire
pkgver=4.2.0
pkgrel=0
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('python' 'python-virtualenv' 'python-pip' 'powershell' 'jdk-openjdk' 'xar' 'bomutils' 'libxml2' 'swig' 'zlib')
license=('BSD-3-Clause')
install="$pkgname.install"
source=("http://http.kali.org/pool/main/p/powershell-empire/${pkgname}_${pkgver}-${pkgrel}kali2_all.deb"
        "$pkgname::git+https://github.com/peek1e/${pkgname}-AUR")
sha256sums=('ee1e8e9ffcdedc6fcf7cf88eee4608150914a8dc33c587f4ba8fdb6c40b0155e'
            'SKIP')

package() {
    ar x $srcdir/${pkgname}_${pkgver}-${pkgrel}kali2_all.deb
    tar -xf $srcdir/data.tar.xz

    mkdir -p "$pkgdir/etc/$pkgname/client"
    mkdir -p "$pkgdir/etc/$pkgname/server"
    install -m 755 "$srcdir/etc/$pkgname/server/config.yaml" "$pkgdir/etc/$pkgname/server/config.yaml"
    install -m 755 "$srcdir/etc/$pkgname/client/config.yaml" "$pkgdir/etc/$pkgname/client/config.yaml"
    install -m 755 "$srcdir/$pkgname/requirements.txt" "$pkgdir/etc/$pkgname/requirements.txt"

    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 "$srcdir/$pkgname/${pkgname}-patched" "$pkgdir/usr/bin/$pkgname"

    mkdir -p "$pkgdirr/usr/share"
    cp -r "$srcdir/usr/share/" "$pkgdir/usr/share/"
    chmod -R 755 "$pkgdir/usr/share/"

    mkdir -p "$pkgdir/var/lib/$pkgname"
    cp -r "$srcdir/var/lib/$pkgname/empire/" "$pkgdir/var/lib/$pkgname/"
}
