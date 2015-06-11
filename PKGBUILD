# Maintainer: Mia Teufel <mteufel@urandom.eu.org>

pkgbase=python-ircreactor-git
pkgname=('python-ircreactor-git' 'python2-ircreactor-git')
pkgver=0.18.7e6d8f8
pkgrel=1
pkgdesc="Conversion of IRC messages into intermediate representation"
arch=('any')
url="https://github.com/mammon-ircd/ircreactor"
license=('custom')
makedepends=('python-setuptools' 'python2-setuptools')
options=(!emptydirs)
source=("python-ircreactor-git::git+https://github.com/mammon-ircd/ircreactor.git")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/python-ircreactor-git"
    echo "$(python setup.py --version).$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}"
    cp -r python-ircreactor-git python2-ircreactor-git
}

package_python-ircreactor-git() {
    depends=('python')
    cd "${srcdir}/python-ircreactor-git"
    python3 setup.py install --root=$pkgdir --optimize=1
    install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}

package_python2-ircreactor-git() {
    depends=('python2')
    cd "${srcdir}/python2-ircreactor-git"
    python2 setup.py install --root=$pkgdir --optimize=1
    install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/COPYING
}
