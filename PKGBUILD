pkgname=powershell-empire
_name=Empire
pkgver=3.8.2
pkgrel=0
pkgdesc="Empire is a PowerShell and Python 3.x post-exploitation framework"
url="https://github.com/BC-SECURITY/Empire"
arch=('any')
depends=('python' 'python-virtualenv' 'python-pip' 'powershell' 'jdk-openjdk' 'xar' 'bomutils' 'libxml2' 'swig' 'zlib')
license=('BSD-3-Clause')
install="$pkgname.install"
source=("http://http.kali.org/pool/main/p/powershell-empire/${pkgname}_${pkgver}-${pkgrel}kali1_all.deb"
        "$pkgname::git+https://github.com/peek1e/${pkgname}-AUR")
sha256sums=('fb01b9a0138dbafeb418350ace8e10dc6b1a0e3c83864a1a2ce4eef78863d36d'
            'SKIP')

package() {
    ar x $srcdir/${pkgname}_${pkgver}-${pkgrel}kali1_all.deb
    tar -xf $srcdir/data.tar.xz

    mkdir -p "$pkgdir/etc/$pkgname"
    install -m 755 "$srcdir/etc/$pkgname/config.yaml" "$pkgdir/etc/$pkgname/config.yaml"
    install -m 755 "$srcdir/$pkgname/requirements.txt" "$pkgdir/etc/$pkgname/requirements.txt"

    mkdir -p "$pkgdir/usr/bin/"
    install -m 755 "$srcdir/$pkgname/${pkgname}-patched" "$pkgdir/usr/bin/$pkgname"

    mkdir -p "$pkgdirr/usr/share"
    cp -r "$srcdir/usr/share/" "$pkgdir/usr/share/"
    chmod -R 755 "$pkgdir/usr/share/"

    mkdir -p "$pkgdir/var/lib/$pkgname/data"
    cp -r "$srcdir/var/lib/$pkgname/data/" "$pkgdir/var/lib/$pkgname/"
}
