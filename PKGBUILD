pkgname=powershell-empire
_name=Empire
pkgver=4.0.2
pkgrel=0
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('python' 'python-virtualenv' 'python-pip' 'powershell' 'jdk-openjdk' 'xar' 'bomutils' 'libxml2' 'swig' 'zlib')
license=('BSD-3-Clause')
install="$pkgname.install"
source=("http://http.kali.org/pool/main/p/powershell-empire/${pkgname}_${pkgver}-${pkgrel}kali1_all.deb"
        "$pkgname::git+https://github.com/peek1e/${pkgname}-AUR")
sha256sums=('1727f4ff2242e55d5aca64311ae9fdb70d74fb43e2b852fd3d41e8ba5298a333'
            'SKIP')

package() {
    ar x $srcdir/${pkgname}_${pkgver}-${pkgrel}kali1_all.deb
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

    mkdir -p "$pkgdir/var/lib/$pkgname/data"
    cp -r "$srcdir/var/lib/$pkgname/data/" "$pkgdir/var/lib/$pkgname/"
}
