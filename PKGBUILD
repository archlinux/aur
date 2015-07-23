# First Linux Arch packager: Serge Victor <arch@random.re>

_pkgname=pypayd
pkgname=$_pkgname-git
pkgver=r20.c179fd6
pkgrel=1
pkgdesc="Minimalistic daemon for accepting bitcoin payments"
arch=('any')
url="https://github.com/pik/pypayd"
license=('MIT')
depends=('python-cherrypy' 'python-flask' 'python-flask-httpauth' 'python-jinja' 'python-markupsafe' 'python-pillow' 'python-werkzeug' 'python-appdirs' 'python-apsw' 'python-configobj' 'python-itsdangerous' 'python-json-rpc' 'python-pycoin' 'python-crypto' 'python-qrcode' 'python-requests' 'python-simple-crypt' 'python-six' 'python-addict')
source=('git+https://github.com/pik/pypayd')
md5sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$_pkgname"

    patch -p0 < ../../pypayd-archlinux.patch
}

build() {
    cd "$srcdir/$_pkgname"
}

package() {
    cd "$srcdir/$_pkgname"

    mkdir -p $pkgdir/usr/share/$_pkgname
    mkdir -p $pkgdir/usr/bin
    install -m755 pypayd.py $pkgdir/usr/bin/pypayd
    cp -r src $pkgdir/usr/share/$_pkgname
    #install -m755 tests.py $pkgdir/usr/share/$pkgname
    #cp -r tests $pkgdir/usr/share/$pkgname
}

# vim:set ts=2 sw=2 et:
