# Maintainer: Giuseppe Nebbione <nebbionegiuseppe at gmail dot com>
# Maintainer: Filipe Nascimento <flipee at tuta dot io>

pkgname=kb-git
_reponame=kb
pkgver=0.1.7.r6.gfa365a3
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
source=("git+$url"
        "python-colored.patch")
md5sums=('SKIP'
         '0a91d77f21a9997139d91c53d59e59f1')

pkgver() {
    cd ${_reponame}
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd ${_reponame}
    patch -p1 < ../python-colored.patch
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
