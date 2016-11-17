# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='python2-rsb-stable-git'
pkgver=0.15.0.7d0fc4d
pkgrel=1
pkgdesc='Robotics Service Bus Python implementation'
arch=(any)
url='https://projects.cor-lab.org/projects/rsb'
license=('LGPL3')
depends=('python2' 'python2-protobuf')
makedepends=('git' 'python2-setuptools' 'rsb-proto-stable-git' 'python2-nose' 'python2-pylint' 'python2-coverage' 'python2-spread')
optdepends=('spread-python2')
checkdepends=('spread-daemon' 'spread-python2' 'python2-nose' 'python2-pylint' 'python2-coverage')
source=("python2-rsb::git+https://code.cor-lab.org/git/rsb.git.python#branch=0.15")
md5sums=('SKIP')
conflicts=('python2-rsb')
provides=('python2-rsb')

pkgver() {
    cd "${srcdir}/python2-rsb"
    printf "%s" "$(git describe --long | sed 's/release-//;s/\([^-]*-\)g/\1/;s/-/./g')"
}

prepare() {
    cd "${srcdir}/python2-rsb"
    cat << EOF >> setup.cfg
[proto]
protocolroot=/usr/share/rsbprotocol0.15
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
