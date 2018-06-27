_pkgname=dups
pkgname=dups-git
pkgver=41db0c2
pkgrel=1
pkgdesc="It deduplicates things - Backup as simple as possible."
arch=("x86_64")
url="https://github.com/linuxwhatelse/dups"
license=('GPL3')
depends=('python' 'openssh' 'rsync' 'dbus' 'libnotify' 'python-gobject'
         'python-dbus' 'python-paramiko' 'python-ruamel-yaml')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/linuxwhatelse/dups.git")
install="dups.install"
md5sums=("SKIP")


pkgver() {
    cd "$srcdir/$_pkgname"
    git rev-parse --short HEAD
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --force --quiet
}
