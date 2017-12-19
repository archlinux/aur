# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=gplaycli
pkgver=3.15
pkgrel=1
pkgdesc="command line tool to search/install/update Android applications Google PlayStore able to run with cronjob, in order to automatically update an F-Droid server instance"
arch=('any')
url="https://github.com/matlink/gplaycli"
license=('AGPL')
depends=('python' "python-requests" "python-protobuf" "python-pyaxmlparser" "python-clint" "python-pyopenssl" 'python-gpapi' 'python-pycryptodome')
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/matlink/gplaycli/archive/${pkgver}.tar.gz"
        "$pkgname.install")
md5sums=('63d66283e0ccdb94f3c2efea6daee1be'
         'e993658f9913493bb4336d73f23a3195')

package() {
    cd gplaycli-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    # installs config to build user home - moving to /usr/share
    mkdir -p "$pkgdir/usr/share/$pkgname/" 
    mv "${pkgdir}${HOME}/.config/$pkgname/" "$pkgdir/usr/share/$pkgname/config"
    rm -rf "$pkgdir/home"
}
