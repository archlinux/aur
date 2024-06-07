pkgname=globus-connect-personal
_pkgname=globusconnectpersonal
pkgver=3.2.5
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
sha256sums=('857281ac01059b0005a0d97d07ff37e16ad8b76e9b9ce0285d0e96744690a3a7'
            'eb12fd5d5d4e111f8a45af5f9ea803203f5c91a513287ba2d15547321fb7a59a'
            '211cca27d2e2fa963606d1d29ceb2d71b333cc33de9a85821d5c85aac36a4a9e'
            'a33e11761644011264a467d3ecf90147fed308b33e8915569cc4d65b2089ff2b'
            '8ee2cd6b18ed0f13021c2afde00a63ff8b31c9022412717a416ba15c2be7793c')

package() {
    cd "$_pkgname-$pkgver"

    local targetdir=$pkgdir/usr/lib/$_pkgname
    install -d $targetdir
    cp -dr --preserve=mode,timestamp . $targetdir

    install -m 755 -D -t $pkgdir/usr/bin/ $srcdir/globusconnect
    install -m 644 -D -t $pkgdir/usr/lib/systemd/user/ $srcdir/globus-connect-personal.service
    install -m 644 -D -t $pkgdir/usr/lib/systemd/system/ $srcdir/globus-connect-personal@.service
}
