# Maintainer: Marcin Tydelski <marcin.tydelski@gmail.com> 
# Contributor: Brian Douglass <https://github.com/bhdouglass/, http://bhdouglass.com/>

_pkgname=clickable
pkgname=clickable-git
pkgver=5.4.0.r0.g459f284
pkgrel=1
pkgdesc='Compile, build, and deploy Ubuntu Touch click packages all from the command line'
arch=('any')
url='https://gitlab.com/clickable/clickable'
license=('GPL3')
depends=('python-cookiecutter' 'docker' 'android-tools')
optdepends=('lxd: use lxd instead of docker (deprecated)'
            'xorg-xhost: for running on the desktop'
            'nvidia-docker-1.0.1: use clickable'\''s desktop mode with proprietary Nvidia drivers')
makedepends=('git')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=('git+https://gitlab.com/clickable/clickable.git')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    python setup.py build
}

package() {
    cd $_pkgname
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
