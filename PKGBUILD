# Maintainer: Manuel Wiesinger <m {you know what belongs here} mmap {and here} at>

_srcname=virtme-ng
pkgver=v1.25.r36.g3bb0256
pkgrel=1
pkgname=$_srcname-git
pkgdesc="A tool that allows to easily and quickly recompile and test a Linux kernel, starting from the source code."
arch=('any')
url="https://github.com/arighi/virtme-ng"
license=('GPL-2.0-only')
makedepends=('git')
depends=('bash' 'python>=3.8' 'python-argcomplete' 'python-importlib-metadata' 'python-requests' 'python-setuptools' 'qemu>=1.6')
optdepends=('busybox: BusyBox support')
conflicts=('virtme-git' 'virtme-ng')
source=("git+${url}.git")
b2sums=('SKIP')

prepare() {
    cd "$srcdir/${_srcname}"

    # Sumlinks do not work with the latest setuptools (could also be something
    # else). So we have to replace the link with its target as a quick fix.
    rm virtme/scripts
    cp -r bin virtme/scripts
}

package() {
    cd "$srcdir/$_srcname"
    python setup.py install --root="$pkgdir/" --optimize=1
}

pkgver() {
    cd "$srcdir/${_srcname}"
    git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
