# Maintainer : Faerbit <faerbit at gmail dot com>

pkgname=campus-ics-feed-git
_pkgname=${pkgname%-git}
pkgver=12.e5e3b72
pkgrel=1
pkgdesc="Simple webserver which serves the ICS calendar file from FH Aachen Campus"
arch=('i686' 'x86_64' 'armv7h')
url="https://github.org/faerbit/campus-ics-feed"
license=('MIT')
depends=('python3' 'python-flask' 'python-requests')
makedepends=('git')
source=("git+https://github.com/faerbit/campus-ics-feed.git")
md5sums=("SKIP")

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$_pkgname"
    # License
    install -D -m644 LICENSE.md "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    # Webapp
    install -D -m644 server.py "$pkgdir/usr/share/webapps/${_pkgname}/server.py"
    chown -R root:http "$pkgdir/usr/share/webapps/${_pkgname}"
}
