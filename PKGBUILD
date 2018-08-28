# Maintainer: robertfoster

pkgname=qviaggiatreno-git
pkgver=14.f46278b
pkgrel=1
pkgdesc="Un'applicazione per controllare gli orari dei treni in tutta Italia tramite il sito viaggiatreno.it."
arch=('i686' 'x86_64')
url="http://www.solotreni.net"
license=('GPL2')
depends=('qt5-base' 'qt5-webkit')
replaces=("${pkgname%%-*}-svn")
conflicts=("${pkgname%%-*}-svn")
source=("qviaggiatreno::git+https://github.com/M0Rf30/qviaggiatreno")

pkgver() {
    cd ${pkgname%%-*}
    echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
    cd ${pkgname%%-*}
    qmake
    make
}

package() {
    cd ${pkgname%%-*}
    install -Dm644 qviaggiatreno.desktop $pkgdir/usr/share/applications/qviaggiatreno.desktop
    install -Dm644 src/img/logo.svg $pkgdir/usr/share/pixmaps/qviaggiatreno.svg
    install -Dm755 bin/qviaggiatreno $pkgdir/usr/bin/qviaggiatreno
}

md5sums=('SKIP')
