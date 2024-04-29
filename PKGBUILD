# Maintainer: Giuseppe Nebbione <nebbionegiuseppe at gmail dot com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=kb-git
_reponame=kb
pkgver=0.1.7.r8.g862a1ab
pkgrel=1
pkgdesc="A command line minimalist knowledge base manager"
arch=('any')
url="https://github.com/gnebbia/kb"
license=('GPL3')
depends=('python-attrs' 'python-colored' 'python-gitpython' 'python-setuptools' 'python-toml')
makedepends=('git')
checkdepends=('python-pytest-cov')
provides=("kb")
conflicts=("kb")
replaces=("python-kb-git")
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd ${_reponame}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd ${_reponame}
    python setup.py build
}

check() {
    cd ${_reponame}
    pytest -v
}

package() {
    cd ${_reponame}
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
