# Maintainer: fordprefect <fordprefect@dukun.de>
# Maintainer: LightDot <lightdot -a-t- g m a i l>

pkgname=gplaycli
pkgver=3.23
pkgrel=1
pkgdesc="command line tool to search/install/update Android applications Google PlayStore able to run with cronjob, in order to automatically update an F-Droid server instance"
arch=('any')
url="https://github.com/matlink/gplaycli"
license=('AGPL')
depends=('python' 'python-pyaxmlparser' 'python-gpapi')
optdepends=('java-runtime: needed for autogeneration of a new AndroiID')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/matlink/gplaycli/archive/${pkgver}.tar.gz"
        "$pkgname.install")
md5sums=('e44442bcd962ac7c908ba6d101d0aed3'
         'e993658f9913493bb4336d73f23a3195')

package() {
    cd $pkgname-$pkgver
    python setup.py install --root="$pkgdir/" --optimize=1

    # installs config to build user home - moving to /usr/share
    mkdir -p "$pkgdir/usr/share/$pkgname/"
    mv "${pkgdir}${HOME}/.config/$pkgname/" "$pkgdir/usr/share/$pkgname/config"
    rm -rf "$pkgdir/build" "$pkgdir/home"
}
