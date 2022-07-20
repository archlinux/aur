# Maintainer: Kodi Craft <kodicraft4 at gmail dot com>
pkgname='kiss-git'
_pkgname='kiss'
pkgver=r36.8afd43a
pkgrel=0
pkgdesc="A GUI utility to change the server of .wrl files for Sapari"
arch=('any')
url="https://github.com/KodiCraft/KISS"
license=('GPL3')
depends=('python' 'python-pyqt5' 'python-requests')
optdepends=()
makedepends=('git')
provides=('kiss')
conflicts=('kiss')
source=('kiss::git+https://github.com/KodiCraft/KISS')
md5sums=('SKIP')

pkgver() {
        cd "$srcdir/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        cd "$srcdir/${_pkgname%-VCS}"
        mkdir -p "$pkgdir/usr/lib/kiss"
        cp -r ./* "$pkgdir/usr/lib/kiss/"
        mkdir -p "$pkgdir/usr/bin"
        echo "
        #!/bin/sh
        python /usr/lib/kiss/main.py
        " > "$pkgdir/usr/bin/kiss"
        chmod +x "$pkgdir/usr/bin/kiss"
}
