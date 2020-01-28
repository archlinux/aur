_pkgname=python-savery
pkgname=python-savery-git
pkgver=r19.bd5c127
pkgrel=2
pkgdesc="A X11 Screensaver (and more) that actually does what I want."
arch=("x86_64")
url="https://github.com/linuxwhatelse/savery"
license=('GPL3')
depends=('coreutils' 'python' 'python-gobject' 'python-xlib' 'python-evdev' 'python-dbus')
makedepends=('python-setuptools')
provides=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/linuxwhatelse/savery.git")
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
    install -Dm644 savery.service ${pkgdir}/usr/lib/systemd/user/savery.service
}


# vim: set syntax=sh:
