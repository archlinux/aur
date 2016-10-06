# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='python2-rsb'
pkgver=0.14.1.cdf638a
pkgrel=1
pkgdesc='Robotics Service Bus Python implementation'
arch=(any)
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('python2' 'python2-protobuf')
makedepends=('git' 'python2-setuptools' 'rsb-proto' 'python2-nose' 'python2-pylint' 'python2-coverage' 'spread-python2')
optdepends=('spread-python2')
checkdepends=('spread-daemon' 'spread-python2' 'python2-nose' 'python2-pylint' 'python2-coverage')
source=("python2-rsb::git+https://code.cor-lab.org/git/rsb.git.python#branch=0.14")
md5sums=('SKIP')

pkgver() {
    cd "${srcdir}/python2-rsb"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/python2-rsb"
    cat << EOF >> setup.cfg
[proto]
protocolroot=/usr/share/rsbprotocol0.14
EOF
}

build() {
    cd "${srcdir}/python2-rsb"
    python2 setup.py bdist_egg
}

check() {
    cd "${srcdir}/python2-rsb"
    python2 setup.py nosetests
}

package() {
    cd "${srcdir}/python2-rsb"
    python2 setup.py install --root="${pkgdir}/" --optimize=1
}
