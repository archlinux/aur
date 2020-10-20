pkgname=globus-connect-personal
_pkgname=globusconnectpersonal
pkgver=3.1.2
pkgrel=1
pkgdesc="Globus Connect Personal turns your laptop or other personal computer into a Globus endpoint with a just a few clicks."
arch=('x86_64')
url="https://www.globus.org/globus-connect-personal"
license=('Apache')
depends=('python' 'libtool')
optdepends=('tk: for GUI')
install=$pkgname.install
source=("https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz"
        "$pkgname.install"
        "$pkgname.service"
        "$pkgname@.service"
        "globusconnect")
sha256sums=('f4217a215885094a164e3c69c0f720cb420eaba89b81a3c4872c84d9bbdaa7c6'
            'e02212562b046dbe6d92e9a0ecd9aead22c6fec85a525a4e7c05451b1d76aec1'
            '211cca27d2e2fa963606d1d29ceb2d71b333cc33de9a85821d5c85aac36a4a9e'
            'a33e11761644011264a467d3ecf90147fed308b33e8915569cc4d65b2089ff2b'
            'd5fdbd95707bce40f1e6db29f528328eeb03f364aa33d2021a03b01f6174f916')

package() {
    cd "$_pkgname-$pkgver"

    local targetdir=$pkgdir/usr/lib/$_pkgname
    install -d $targetdir
    cp -dr --preserve=mode,timestamp . $targetdir

    install -m 755 -D -t $pkgdir/usr/bin/ $srcdir/globusconnect
    install -m 644 -D -t $pkgdir/usr/lib/systemd/user/ $srcdir/globus-connect-personal.service
    install -m 644 -D -t $pkgdir/usr/lib/systemd/system/ $srcdir/globus-connect-personal@.service
}
