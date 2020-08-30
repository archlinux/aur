# Maintainer: David Parrish <daveparrish@tutanota.com>

# shellcheck disable=SC2034,SC2164

pkgname=joinmarket-qt-git
pkgver=0.7.0.r3.gc90432e
pkgrel=1
pkgdesc="Coinjoin software, includes a QT wallet and requires Bitcoin Core as backend"
arch=('any')
depends=( 'python-pyqt5' 'pyside2' 'python-qt5reactor'
          'python-jmbase-git' 'python-jmclient-git' 'python-jmbitcoin-git' 'python-jmdaemon-git'
         )
makedepends=('git' 'python-setuptools')
url="https://github.com/JoinMarket-Org/joinmarket-clientserver"
license=('GPL3')
source=("$pkgname::git+https://github.com/JoinMarket-Org/joinmarket-clientserver.git"
       "joinmarket-qt")
sha256sums=('SKIP'
            '5a4b5f36706f6de0b7c360871e2bbdc5ecf33505b8565365363fdecf1c10e051')
options=(!strip)

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

# GUI and other scripts
package_joinmarket-qt-git() {
    # Dump scripts into /opt/joinmarket
    mkdir -p "${pkgdir:?}/opt/$pkgname"
    cp -r "${srcdir:?}/${pkgname}/scripts/"* "${pkgdir}/opt/$pkgname"

    # Use entrypoint script to manage getting joinmarket-qt started
    mkdir -p "$pkgdir/usr/bin"
    cp "$srcdir/joinmarket-qt" "$pkgdir/usr/bin"
}
