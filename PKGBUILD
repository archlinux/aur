# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>
_pkg='easybuild-framework'
pkgname="${_pkg}-git"
pkgver=4.8.2.r41.ga2eaf2365
pkgrel=1
pkgdesc="A software build and installation framework for HPC systems (development)"
arch=('any')
url="https://github.com/easybuilders"
license=('GPL2')
depends=('python' 'env-modules-tcl' 'python-setuptools' 'python-distro'
         'python-yaml' 'python-configobj' 'python-packaging'
         'python-humanfriendly' 'python-requests')
optdepends=('lmod: another module management tool'
            'fpm: Generate packages of your modules to be installed later'
            'easybuild-easyconfigs: collection of build parameters'
            'easybuild-easyblocks: collection of module recipes'
            'python-gitpython: for using Git with EasyBuild'
            'graphviz: for building nice looking dependency graphs'
            'python-keyring: for handling authentication with GitHub'
            'python-rich: lets EasyBuild show rich-output, i.e. nice progress bars')
makedepends=('git')
provides=("${_pkg}")
source=("git+https://github.com/easybuilders/${_pkg}.git#branch=develop")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkg"
    printf "%s" "$(git describe --long | sed 's/\([^-]*-g\)/r\1/;s/.*v\(.*\)$/\1/;s/-/./g')"
}

prepare() {
    git -C "$srcdir/$_pkg" clean -dfx
}

build() {
    cd "$srcdir/$_pkg"
    python setup.py build
}

package() {
    cd "$srcdir/$_pkg"
    python setup.py install --root="$pkgdir" --optimize=1
}
