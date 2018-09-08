# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgbase=('stig')
pkgname=('stig')
pkgver=0.10.0a
pkgrel=1
pkgdesc='TUI and CLI client for the Transmission daemon'
url='https://github.com/rndusr/stig'
depends=('python' 'python-urwid' 'python-urwidtrees' 'python-aiohttp'
         'python-xdg' 'python-blinker' 'python-natsort')
makedepends=('python-setuptools')
optdepends=('python-maxminddb: shows country codes in peer lists'
            'python-pprofile: profiling'
            'python-setproctitle: prettifies the process name')

license=('GPL')
arch=('any')
source=("stig-${pkgver}.tar.gz::https://github.com/rndusr/stig/archive/v${pkgver}.tar.gz")
sha256sums=('45a89771cc9d7eaa9b51055e219e02e175859a427f173e796ec875c3db3d81a5')

prepare(){
    cd "stig-${pkgver}"
    sed -i 's/urwidtrees>=1.0.3dev0/urwidtrees>=1.0.2/' setup.py
}

build() {
    cd "stig-${pkgver}"
    python setup.py build
}

package() {
    cd "stig-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
