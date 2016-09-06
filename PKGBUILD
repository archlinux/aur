# Maintainer: Felipe F. Tonello <eu@felipetonello.com>
# TODO: support Toast

pkgbase=bitbake
pkgname=('bitbake' 'bitbake-vim')
pkgver=1.30
pkgrel=5
pkgdesc="Build tool executing tasks and managing metadata."
arch=('any')
url="http://openembedded.org"
license=('GPL2')
makedepends=('python2' 'python2-progressbar' 'python2-ply' 'python2-pyinotify' 'python2-beautifulsoup4' 'python2-codegen')
source=(https://github.com/openembedded/${pkgbase}/archive/${pkgver}.zip)
md5sums=('78f913fa7ca7674705b05fb04d1067ce')

check() {
    cd ${srcdir}/${pkgbase}-${pkgver}/bin
    PYTHONPATH=`pwd`/../lib:`pwd`/../lib/bb python2 ./bitbake-selftest
}

package_bitbake() {
    depends=('python2' 'python2-progressbar' 'python2-ply' 'python2-pyinotify' 'python2-beautifulsoup4' 'python2-codegen')
    install=bitbake.install

    cd ${srcdir}/${pkgbase}-${pkgver}

    install -d ${pkgdir}/usr/bin
    install bin/bitbake* ${pkgdir}/usr/bin

    install -d ${pkgdir}/usr/lib/python2.7/site-packages
    cp -Ra lib/bb ${pkgdir}/usr/lib/python2.7/site-packages
    cp -Ra lib/prserv ${pkgdir}/usr/lib/python2.7/site-packages

    install -d ${pkgdir}/usr/share/man/man1
    install doc/bitbake.1 ${pkgdir}/usr/share/man/man1
}

package_bitbake-vim() {
    cd ${srcdir}/${pkgbase}-${pkgver}

    install -d ${pkgdir}/usr/share
    cp -Ra contrib/vim ${pkgdir}/usr/share
}
