# Maintainer: Matej Dujava <mdujava (plus) aur (at) kocurkovo (dot) cz>

pkgname=('beaker-common' 'beaker-client')
pkgbase='beaker'
pkgver=29.3
pkgrel=1
pkgdesc="Full-stack software and hardware integration testing system"
arch=('any')
url="https://beaker-project.org/"
license=('GPL-2.0-or-later')
makedepends=('python-setuptools' 'python-sphinx' 'python-sphinxcontrib-httpdomain' 'python-docutils' 'python-six' 'python-gssapi' 'python-lxml')
depends=('python3' 'python-six' 'python-setuptools' 'python-gssapi' 'python-lxml')
provides=('bkr' 'beaker-wizard')
options=('zipman')
source=("https://github.com/beaker-project/beaker/archive/refs/tags/$pkgbase-$pkgver.tar.gz")
sha256sums=('dd4b03f48da62409cd35a2997d571c2f0c553516eb1b531f90bfd9048b9e863a')

build() {
        export BKR_PY3="$(which python3)"
        cd "$pkgbase-$pkgbase-$pkgver"
        make -C documentation build
        make -C Common build
        make -C Client build
}

package_beaker-common() {
	pkgdesc="Full-stack software and hardware integration testing system - common files"

        export BKR_PY3="$(which python3)"
        cd "$pkgbase-$pkgbase-$pkgver"
        make DESTDIR="$pkgdir/" -C Common install
}

package_beaker-client() {
        pkgdesc="Full-stack software and hardware integration testing system - cli"
        depends=('python3' 'python-six' 'python-setuptools' 'python-gssapi' 'python-lxml' 'python-requests' 'python-prettytable' 'python-jinja' 'python-importlib-metadata' "beaker-common=$pkgver")

        export BKR_PY3="$(which python3)"
        cd "$pkgbase-$pkgbase-$pkgver"
        make DESTDIR="$pkgdir/" -C Client install
        rm -frv "$pkgdir/bkr/client/tests"

}
