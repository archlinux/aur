# Maintainer: Jonas Jochamring <mail at feuri dot de
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: Christian Berendt <christian@thorlin.de>

pkgname=bcfg2
pkgver=1.3.6
pkgrel=2
pkgdesc="Configuration management tool."
url="http://bcfg2.org"
license=('BSD')
arch=('i686' 'x86_64')
depends=('python2' 'python2-setuptools' 'python2-lxml' 'python2-lockfile' 'python2-daemon')
optdepends=('gamin: autodetect changes without bcfg2 server restart (only one needed)'
            'python2-pyinotify: autodetect changes without bcfg2 server restart (only one needed)'
            'python2-genshi: Genshi templating plugin'
            'python2-cheetah: Cheetah templating plugin')
source=("ftp://ftp.mcs.anl.gov/pub/bcfg/${pkgname}-${pkgver}.tar.gz")
md5sums=('07065402dc1ae4525894fdb148c1b668')

build() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py build
}

package() {
    cd $srcdir/$pkgname-$pkgver
    python2 setup.py install --root=$pkgdir
    install -d $pkgdir/usr/lib/systemd/system
    install -m 644 redhat/systemd/bcfg2-server.service $pkgdir/usr/lib/systemd/system
    install -m 644 redhat/systemd/bcfg2.service $pkgdir/usr/lib/systemd/system
}
