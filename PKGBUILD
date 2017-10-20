# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgbase=('stig-git')
pkgname=('stig-git')
pkgver=0.7.3a.r524.b763aca
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees-git' 'python-aiohttp'
         'python-xdg' 'python-blinker' 'python-natsort')
makedepends=('git' 'python-setuptools')
optdepends=('python-geoip: shows country codes in peer lists')
license=('GPL')
arch=('any')
provides=('stig')
conflicts=('stig')
source=("git+https://github.com/rndusr/stig.git#branch=dev" "fix_xdg_dep_on_arch.patch")
sha256sums=('SKIP'
            '274f56f53c8eeb582c26dba53cf01cd8a91bec88d24f80a9fc72c423064fb479')

pkgver() {
    cd stig
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
    cd stig
    patch -p1 -i "${srcdir}/fix_xdg_dep_on_arch.patch"
    python setup.py build
}

package() {
    cd stig
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
