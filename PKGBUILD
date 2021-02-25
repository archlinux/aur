# Maintainer: Martin Scholz <scholz.m82@gmail.com
pkgname=tryton
pkgver=5.8.4
_pkgdir=5.8
pkgrel=1
pkgdesc="Tryton desktop client"
arch=('any')
url="http://www.tryton.org/"
license=('GPL3')
depends=('python>=3.6' 'python-cairo' 'python-dateutil' 'python-pygobject-stubs' 'pygobject-devel')
makedepends=('python-distribute')
source=("http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz"
        "http://downloads.tryton.org/$_pkgdir/$pkgname-$pkgver.tar.gz.asc"
        'tryton.desktop'
        'tryton-icon.png')
sha256sums=('5d9ac201478e1d5e31cfeaca0a6465ea7dc516ab6667bfb08653862ba190ce2c'
            'SKIP'
            '78378206bbd3264cbcf23e2836e4bbb70ad1ea643c4db71dccf997ff2fb06443'
            'ef2440c3f8f905e8636a07e5d032939bbf835b25bc7e998482cbbf4c78878831')
b2sums=('80c31703ca02da78f4614829e97cdf8a4c1c742038ddf47077268b2fb993cad49bef82af2efe89385d8be595b54675cbb1e1c5b456a93fb089e0ed49171a8ff4'
        'SKIP'
        '7bc3ca915f022cbd120fb93d085502325e0a69415884553dead86720ac976438352f3bd9334400cb1c4827bda64c9749695447d64f22848ae4d517c373154ea3'
        'cd34fb947aa6e02a2d0b805444b12b122caf20aa7d67428b609b21f71f86ce1dee0311eba42cbca8467eb5d90bde45c2e6b287fd0661253cc180028d4a7d5676')
validpgpkeys=('7C5A4360F6DF81ABA91FD54D6FF50AFE03489130') # Cédric Krier

build() {
	cd $srcdir/$pkgname-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/$pkgname-$pkgver
	python setup.py install --root=$pkgdir --optimize=1
	install -D -m644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -D -m644 "$srcdir/tryton-icon.png" "$pkgdir/usr/share/pixmaps/tryton/tryton-icon.png"
}

