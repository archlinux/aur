# Maintainer: Sven Fischer <sven |a| leiderfischer |.| de>
# Contributor: Thomas Robinson <robinsthom |a| gmail |.| com>
#              Visa Jokelainen <visaj |a| iki |.| fi>
pkgname=robotframework
pkgver=6.0.2
pkgrel=1
pkgdesc="A keyword-driven test automation framework"
arch=('any')
url="http://www.robotframework.org"
license=('Apache')
depends=('python')
optdepends=('jython: for using robotframework with Java (must be installed before running PKGBUILD)')
source=("https://github.com/$pkgname/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('8abf14ae37187dd9c4d1046cfe88367e')

package() {
    cd "$srcdir/$pkgname-$pkgver"

    echo "creating pybot scripts"
    python setup.py install --prefix=/usr --root="$pkgdir" || return 1

    if pacman -Qsq ^jython$;
    then
        echo "creating jybot scripts"
        jython setup.py install --prefix=/opt/jython --root="$pkgdir" || return 1
        mv $pkgdir/opt/jython/bin/* $pkgdir/usr/bin/
    fi
}
