_pkgname=python-dups
pkgname=python-dups-git
pkgver=r75.c3d4205
pkgrel=1
pkgdesc="It deduplicates things - Backup as simple as possible."
arch=("x86_64")
url="https://github.com/linuxwhatelse/dups"
license=('GPL3')
depends=('python' 'rsync' 'dbus' 'libnotify' 'python-gobject' 'python-dbus'
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
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --force --quiet

    install -d "${pkgdir}/usr/lib/systemd/user"
    install -m 644 "data/systemd/dups.service" "${pkgdir}/usr/lib/systemd/user"
}


# vim: set syntax=sh:

