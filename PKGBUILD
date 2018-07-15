_pkgname=python-dups
pkgname=python-dups-git
pkgver=r99.158b91a
pkgrel=1
pkgdesc="It deduplicates things - Backup as simple as possible."
arch=("x86_64")
url="https://github.com/linuxwhatelse/dups"
license=('GPL3')
depends=('python' 'rsync' 'dbus' 'python-gobject' 'python-dbus'
         'python-paramiko' 'python-ruamel-yaml')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/linuxwhatelse/dups.git")
install="python-dups.install"
md5sums=("SKIP")


pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_pkgname}"
    python setup.py build
}

package() {
    export INCLUDE_DATA_FILES="systemd dbus desktop"

    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --force --quiet
}


# vim: set syntax=sh:

