_pkgname=python-dups
pkgname=python-dups-git
pkgver=r131.d9aba33
pkgrel=1
pkgdesc="It deduplicates things - Backup as simple as possible."
arch=("x86_64")
url="https://github.com/linuxwhatelse/dups"
license=('GPL3')
depends=('python' 'rsync' 'python-paramiko' 'python-ruamel-yaml')
optdepends=('python-dbus: Daemon support'
            'python-gobject: Desktop notification support')
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
