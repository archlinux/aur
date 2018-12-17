# Maintainer: Guillaume Hayot <postblue@postblue.info>
# Author: Kjö Hansi Glaz <kjo@a4nancy.net.eu.org>
# TODO: Fix broken help page

pkgname=bookletimposer
pkgver=0.2
pkgrel=3
pkgdesc="Achieve some basic imposition on PDF documents"
arch=('any')
url="http://kjo.herbesfolles.org/bookletimposer/"
license=('GPLv3+')
depends=('python2>=2.6' 'python2-pypdf2>=1.13' 'python2-gobject' 'desktop-file-utils')
makedepends=('python2-distutils-extra' 'pandoc')
install=bookletimposer.install
source=("http://kjo.herbesfolles.org/bookletimposer/archive/$pkgname-$pkgver.tar.gz")
md5sums=("c0e5517bae1949dc1d707541f7a8eb51")

prepare() {
        cd "$pkgname-$pkgver"
        sed -i 's/env python$/&2/' lib/$pkgname/__init__.py lib/$pkgname/backend.py lib/$pkgname/config.py lib/$pkgname/gui.py lib/pdfimposer.py setup.py bin/$pkgname
}

package() {
        cd "$pkgname-$pkgver"
        python2 setup.py install --prefix=/usr --root="$pkgdir" --optimize 1
        ln -s /usr/share/pixmaps/bookletimposer.svg $pkgdir/usr/share/bookletimposer/bookletimposer.svg
}
