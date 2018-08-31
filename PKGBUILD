# Maintainer: Peter Mattern <pmattern at arcor dot de>
# Maintainer: Simon Hanna <simon dot hanna AT serve-me DOT info>

pkgbase=python-django-crispy-forms
pkgname=(${pkgbase} 'python2-django-crispy-forms')
pkgver=1.7.2
pkgrel=1
pkgdesc='DRY Django forms'
arch=('any')
url='https://github.com/django-crispy-forms/django-crispy-forms'
license=('MIT')
makedepends=('python-setuptools' 'python-django' 'python2-setuptools' 'python2-django')
source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/django-crispy-forms/django-crispy-forms/archive/${pkgver}.tar.gz")
sha256sums=('c42f8a388e152ac403b9129db3c65a1deccd23f98b43efc4ad4644d2c823cce0')

prepare() {
    cp -r django-crispy-forms-${pkgver} django-crispy-forms-${pkgver}-python2
}

build() {

    cd ${srcdir}/django-crispy-forms-${pkgver}
    python setup.py build

    cd ${srcdir}/django-crispy-forms-${pkgver}-python2
    python2 setup.py build

}

package_python-django-crispy-forms() {

    depends=('python-django')

    cd django-crispy-forms-${pkgver}
    python setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/django-crispy-forms-${pkgver}/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}

package_python2-django-crispy-forms() {

    depends=('python2-django')

    cd django-crispy-forms-${pkgver}-python2
    python2 setup.py install --root ${pkgdir} --optimize=1

    install -Dm644 ${srcdir}/django-crispy-forms-${pkgver}-python2/LICENSE.txt ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE

}
