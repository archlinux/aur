# Maintainer: Desmond Kabus <desmond.kabus@protonmail.com>

pkgbase=python-icalendar-searcher-git
pkgname=python-icalendar-searcher-git
_module='icalendar_searcher'
pkgver=1.0.3.r0.g53e4ea2
pkgrel=1
pkgdesc="Searching, filtering and sorting icalendar data"
url="https://github.com/python-caldav/icalendar-searcher"
depends=('python' 'python-icalendar' 'python-recurring-ical-events')
makedepends=('python-setuptools' 'git')
provides=('python-icalendar-searcher')
conflicts=('python-icalendar-searcher')
license=('AGPL-3.0-or-later')
arch=('any')
source=("icalendar_searcher::git+https://github.com/python-caldav/icalendar-searcher")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_module}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_module}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
