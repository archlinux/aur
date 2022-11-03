pkgname=globus-connect-personal
_pkgname=globusconnectpersonal
pkgver=3.2.0
pkgrel=1
pkgdesc="Globus Connect Personal turns your laptop or other personal computer into a Globus endpoint with a just a few clicks."
arch=('x86_64')
url="https://www.globus.org/globus-connect-personal"
license=('Apache')
depends=('python' 'libtool' 'libxcrypt-compat')
optdepends=('tk: for GUI')
install=$pkgname.install
source=("https://downloads.globus.org/globus-connect-personal/v3/linux/stable/globusconnectpersonal-${pkgver}.tgz"
        "$pkgname.install"
        "$pkgname.service"
        "$pkgname@.service"
        "globusconnect")
sha256sums=('08742b61e917b3badf2d6385a814cadcfd92c623a5fcc7532718297fa56f3d89'
            'eb12fd5d5d4e111f8a45af5f9ea803203f5c91a513287ba2d15547321fb7a59a'
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
