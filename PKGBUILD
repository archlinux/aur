pkgname=panopta-agent
pkgver=2018.06.3
pkgrel=1
pkgdesc="Panopt agent"
arch=('any')
url="https://my.panopta.com"
license=('custom')
depends=('python2' 'cronie')
source=("http://packages.panopta.com/tar/panopta-agent-tarball-latest.tar.gz" "panopta-agent.cron" "license.txt")
install=$pkgname.install
md5sums=('a279617492c7566d6444d3f46b1cdae7' '9b2e7feea2a4b4d0ff3ac4b828eaa8bb' '2a657feea0ec01bf57ffad93686ea9c2')

pkgver() {
    cd "$srcdir"
    echo $(tar -tf panopta-agent-tarball-latest.tar.gz | head -n1 | sed 's/panopta-agent-//; s/\///')
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    # /usr/lib
    mkdir -p "$pkgdir/usr/lib/$pkgname"
    cp -r lib/* "$pkgdir/usr/lib/$pkgname"

    # /usr/bin
    mkdir -p "$pkgdir/usr/bin/$pkgname"
    cp -r bin/* "$pkgdir/usr/bin/$pkgname"

    # /var/lib
    mkdir -p "$pkgdir/var/lib/$pkgname"
    touch "$pkgdir/var/lib/$pkgname/register"
    touch "$pkgdir/var/lib/$pkgname/report"

    # Copy cron file
    mkdir -p "$pkgdir/etc/cron.d"
    mv "$srcdir/$pkgname.cron" "$pkgdir/etc/cron.d/$pkgname"

    # Copy license
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    mv "$srcdir/license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}
