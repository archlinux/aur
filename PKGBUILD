# Contributor: jiuren <qiuwei1987@gmail.com>
# Maintainer: Benoit Favre <benoit.favre@lif.univ-mrs.fr>
# Contributor: Kristof Marussy <kris7topher@gmail.com>
pkgname=liblinear
pkgver=1.96
pkgrel=1
pkgdesc="A Library for Large Linear Classification"
arch=('i686' 'x86_64')
url="http://www.csie.ntu.edu.tw/~cjlin/liblinear/"
license=('BSD')
groups=()
depends=('coreutils')
makedepends=()
optdepends=(
'python: bindings for latest python version'
'python2: bindings for python 2'
'gcc-libs')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("http://www.csie.ntu.edu.tw/~cjlin/cgi-bin/liblinear.cgi?+http://www.csie.ntu.edu.tw/~cjlin/liblinear+tar.gz")
noextract=()
md5sums=('e689ab6a01644a3aa615d2613c55c539')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make lib all
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -D -m755 train $pkgdir/usr/bin/liblinear-train
    install -D -m755 predict $pkgdir/usr/bin/liblinear-predict
    install -D -m644 liblinear.so.2 $pkgdir/usr/lib/liblinear.so.2
    install -D -m644 linear.h $pkgdir/usr/include/linear.h
    ln -s liblinear.so.2 $pkgdir/usr/lib/liblinear.so

    cd python
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' liblinear.py
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' liblinearutil.py
    install -D -m644 liblinear.py $pkgdir/usr/lib/python2.7/liblinear.py
    install -D -m644 liblinearutil.py $pkgdir/usr/lib/python2.7/liblinearutil.py
    sed -i 's_#!/usr/bin/env python2_#!/usr/bin/env python3_' liblinear.py
    sed -i 's_#!/usr/bin/env python2_#!/usr/bin/env python3_' liblinearutil.py
    install -D -m644 liblinear.py $pkgdir/usr/lib/python3.4/liblinear.py
    install -D -m644 liblinearutil.py $pkgdir/usr/lib/python3.4/liblinearutil.py
}
