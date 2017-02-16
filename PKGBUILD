# Maintainer: Johannes Wienke <languitar@semipol.de>

pkgname='rsb-process-monitor-git'
pkgver=2.0.r7.g668403b
pkgrel=2
pkgdesc='RSB process monitoring'
arch=('i686' 'x86_64')
url='https://projects.cor-lab.org/projects/rsb-performance-monitor'
license=('LGPL3')
depends=('rsc-stable-git' 'rst-proto-stable-git' 'rsb-cpp-stable-git')
makedepends=('git' 'cmake')
source=("rsb-process-monitor::git+https://code.cor-lab.org/git/rsb-performance-monitor.git.process-monitor#branch=master")
md5sums=('SKIP')
install=rsb-process-monitor-git.install

pkgver() {
    cd "${srcdir}/rsb-process-monitor"
    printf "2.0.r%s" "$(git describe --tags | cut -d - -f 3-4 | sed 's/-/./g')"
}

build() {
    cd "${srcdir}/rsb-process-monitor"
    rm -rf build
    mkdir -p build
    cd build
    cmake -DCMAKE_INSTALL_PREFIX=/usr ..
    make
}

package() {
    cd "${srcdir}/rsb-process-monitor/build"
    make DESTDIR="${pkgdir}/" install
    cp "${pkgdir}/usr/bin/rsb-process-monitor2.0" "${pkgdir}/usr/bin/rsb-process-monitor2.0-net"
    chgrp 777 "${pkgdir}/usr/bin/rsb-process-monitor2.0-net"
    chmod 754 "${pkgdir}/usr/bin/rsb-process-monitor2.0-net"
}
