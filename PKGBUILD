# Maintainer: Christian Zugno < chriszugno [at] gmail [dot] com >

pkgname=stig-git
pkgver=0.11.2a0.r0.7ab3df0c
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
         'python-pyxdg' 'python-blinker' 'python-natsort')
makedepends=('git' 'python-setuptools')
optdepends=('python-pprofile: profiling'
            'python-setproctitle: prettifies the process name')
license=('GPL')
arch=('any')
provides=('stig')
conflicts=('stig')

source=("git+https://github.com/rndusr/stig.git")

sha256sums=('SKIP')

pkgver() {
    cd stig
    printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

prepare(){
    cd stig
    sed -i 's/urwidtrees>=1.0.3dev0/urwidtrees>=1.0.2/' setup.py
}

build() {
    cd stig
    python setup.py build
}

package() {
    cd stig
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
