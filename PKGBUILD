# Maintainer: 10sr <8slashes+arch [at] gmail [dot] com>

pkgname=saku
pkgver=4.5.1
pkgrel=1
pkgdesc="A clone of P2P anonymous BBS shinGETsu"
arch=('any')
url="http://shingetsu.info/saku"
license=('2-clause BSD license')
#groups=allyourbase

depends=('python' 'python-jinja' 'python-markupsafe')
optdepends=('python-pillow: Python Imaging Library')

install=$pkgname.install

source=(
    "$pkgname-$pkgver.tgz::https://github.com/shingetsu/$pkgname/archive/release-$pkgver.tar.gz"
    "$pkgname.service"
    "defaultpath.patch"
)
md5sums=('1b9710bbadaeda6f06b28aa481aec833'
         '405694a84e66e6043bb61188d5e766ac'
         'ec52d30651c50038e1b9ca2800b9e363')

prepare(){
    cd "$srcdir"/$pkgname-release-$pkgver
    patch -p1 <../defaultpath.patch
}

package(){
    cd "$srcdir"/$pkgname-release-$pkgver
    make clean
    python3 setup.py install --root="$pkgdir"

    install -Dvm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
    install -Dvm644 ../$pkgname.service \
        "$pkgdir"/usr/lib/systemd/system/$pkgname.service
}
