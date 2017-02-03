# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgbase=python-django-crispy-forms
pkgname=($pkgbase 'python2-django-crispy-forms')
pkgver=1.6.1
pkgrel=1
pkgdesc='DRY Django forms'
arch=('any')
url='https://github.com/django-crispy-forms/django-crispy-forms'
license=('MIT')
makedepends=('python-setuptools' 'python-django' 'python2-setuptools' 'python2-django')
source=("$pkgbase-$pkgver.tar.gz::https://github.com/django-crispy-forms/django-crispy-forms/archive/$pkgver.tar.gz")
sha256sums=('84f70d6cd0f9b7baf69d010fe493ad82e9e4ea7a385eb4dc42e3d9187866a716')

prepare() {
    cp -r django-crispy-forms-$pkgver django-crispy-forms-$pkgver-python2
}

build() {

    cd $srcdir/django-crispy-forms-$pkgver
    python setup.py build

    cd $srcdir/django-crispy-forms-$pkgver-python2
    python2 setup.py build

}

package_python-django-crispy-forms() {

    depends=('python-django')

    cd django-crispy-forms-$pkgver
    python setup.py install --root $pkgdir --optimize=1

    install -Dm644 $srcdir/django-crispy-forms-$pkgver/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}

package_python2-django-crispy-forms() {

    depends=('python2-django')

    cd django-crispy-forms-$pkgver-python2
    python2 setup.py install --root $pkgdir --optimize=1

    install -Dm644 $srcdir/django-crispy-forms-$pkgver-python2/LICENSE.txt $pkgdir/usr/share/licenses/$pkgname/LICENSE

}
