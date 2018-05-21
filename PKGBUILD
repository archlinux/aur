# Maintainer: Ainola
# Contributor: Ethan Schoonover

pkgname=gam
pkgver=4.40
pkgrel=1
pkgdesc="Command line tool for Google G Suite Administrators to manage domain and user settings quickly and easily."
arch=('any')
url="https://github.com/jay0lee/GAM"
license=('Apache')
depends=(
    'python2'
    'python2-google-api-python-client'
    'python2-httplib2'
    'python2-simplejson'
    'python2-gdata'
    'python2-google-auth'
    'python2-utils'
    'perl-mozilla-ca'
)
source=(
    "https://github.com/jay0lee/GAM/archive/v${pkgver}.tar.gz"
    "python2.patch"
    "python_utils_import.patch"
    "gam.sh"
)
sha256sums=('01ce48e0ac79f35ba6c891e54156c67af232f210e98dea2b3178186659064ee0'
            '417f05ee7da33763f56b7b148f46564859133ececbd5a847cd3396a9802d5944'
            '4ab006cec39b8d2307cd338d6ff09b4621e3a4abcd0e1362f26a47de9539e9db'
            'd93809852ef9eefeb99f3fc1b955305264f93f2552db14b4d9d6fe7c2b08345b')

prepare(){
    patch -i "$srcdir/python2.patch" -d "$srcdir/GAM-$pkgver/src/"
    patch -i "$srcdir/python_utils_import.patch" -d "$srcdir/GAM-$pkgver/src/"
}

package() {
    install -m755 -d "$pkgdir/etc/$pkgname/"
    install -m755 -d "$pkgdir/usr/share/$pkgname"
    touch "$pkgdir/etc/$pkgname/noupdatecheck.txt"
    touch "$pkgdir/etc/$pkgname/nobrowser.txt"
    install -Dm755 "$srcdir/GAM-$pkgver/src/gam.py" "$pkgdir/usr/share/$pkgname/gam.py"
    install -Dm644 "$srcdir/GAM-$pkgver/src/var.py" "$pkgdir/usr/share/$pkgname/var.py"
    install -Dm755 "$srcdir/gam.sh" "$pkgdir/usr/bin/gam"

    ln -s /usr/share/perl5/vendor_perl/Mozilla/CA/cacert.pem \
        "$pkgdir/usr/share/$pkgname/cacert.pem"
}
