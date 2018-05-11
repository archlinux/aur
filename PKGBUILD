# Maintainer: Kazuo Teramoto <kaz.rag at gmail dot com>

pkgbase=('stig')
pkgname=('stig')
pkgver=0.9.0a
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
sha256sums=('ca22a9ab7d686dddfa1d10c028c80b7aea83677ca508918f024e6bcd4dd51dc8')

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
