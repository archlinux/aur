# Maintainer: Razer <razer[AT]neuf[DOT]fr>
pkgname=bubblemail-git
pkgver=1.8.r1.g8735223
pkgrel=1
pkgdesc="New and Unread mail notification service for local mailboxes, pop, imap, and gnome online accounts"
pkgbasename=bubblemail
provides=("${pkgbasename}")
conflicts=("${pkgbasename}")
arch=(any)
url="https://framagit.org/razer/bubblemail/"
license=('GPL2')
makedepends=('python-setuptools' 'python-pillow' 'vala' 'folks')
depends=('python' 'python-dbus' 'python-gobject' 'python-pysocks' 'python-pyxdg' 'libsecret' 'gnome-keyring')
optdepends=('gnome-online-accounts' 'gnome-shell-extension-bubblemail-git' 'folks')
source=("git+https://framagit.org/razer/bubblemail.git/")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgbasename}"
    git describe --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgbasename}"
    python setup.py build || return 1
}

package() {
    cd "${srcdir}/${pkgbasename}"
    python setup.py install --root=${pkgdir} --optimize=1 || return 1
}
