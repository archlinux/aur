# Maintainer: Ainola
# Contributor: Ethan Schoonover

pkgname=gam
pkgver=4.71
pkgrel=1
pkgdesc="Command-line tool for Google GSuite admins to manage settings quickly and easily."
arch=('any')
url="https://github.com/jay0lee/GAM"
license=('Apache')
depends=(
    'python2'
    'python2-gdata'
    'python2-google-api-python-client'
    'python2-google-auth'
    'python2-google-auth-httplib2'
    'python2-httplib2'
    'python2-oauth2client'
    'python2-passlib'
    'python2-simplejson'
)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/jay0lee/GAM/archive/v${pkgver}.tar.gz"
    "xdg_config_dirs.patch"
    "gam.sh"
)

sha256sums=('231e6536a3942f82afb6ab7d469c0ce894cb5aff1adfb6fac69e4b90586971b5'
            '2879cbdcde779fa9cc6bafeadf657369377e5c317e9564c5e144c29ba9daa383'
            'd93809852ef9eefeb99f3fc1b955305264f93f2552db14b4d9d6fe7c2b08345b')

prepare() {
    mv "GAM-$pkgver" "$pkgname-$pkgver"
    cd "$pkgname-$pkgver"
    patch -p0 < ../xdg_config_dirs.patch
}

package() {
    install -m755 -d "$pkgdir/etc/$pkgname/"
    touch "$pkgdir/etc/$pkgname/noupdatecheck.txt"
    touch "$pkgdir/etc/$pkgname/nobrowser.txt"
    install -Dm755 "$pkgname-$pkgver/src/gam.py" -t "$pkgdir/usr/share/$pkgname/"
    install -Dm644 "$pkgname-$pkgver"/src/{var,utils}.py -t "$pkgdir/usr/share/$pkgname/"
    install -Dm755 gam.sh "$pkgdir/usr/bin/gam"
}
