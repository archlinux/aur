_name="django-cms"
pkgbase="python-django-cms"
pkgname=("python-django-cms" "python2-django-cms")
pkgver=3.7.1
pkgrel=1
pkgdesc="An Advanced Django CMS"
url="https://django-cms.org"
arch=('any')
license=('BSD')
makedepends=("python-django" "python-django-classy-tags" "python-django-formtools" "python-treebeard" "python-django-sekizai" "python-djangocms-admin-style")
makedepends+=("python2-django" "python2-django-classy-tags" "python2-django-formtools" "python2-treebeard" "python2-django-sekizai" "python2-djangocms-admin-style")
source=("$pkgname-$pkgver.tar.gz::https://github.com/divio/django-cms/archive/$pkgver.tar.gz")
md5sums=('090687adebc1277639801bf53dae4600')


prepare() {
    cp -r $_name-$pkgver{,-py2}
}

build() {
    cd $_name-$pkgver
    python setup.py build

    cd "$srcdir/$_name-$pkgver-py2"
    python2 setup.py build
}

package_python-django-cms() {
    depends=("python-django" "python-django-classy-tags" "python-django-formtools" "python-treebeard" "python-django-sekizai" "python-djangocms-admin-style")

    cd $_name-$pkgver
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}

package_python2-django-cms() {
    depends=("python2-django" "python2-django-classy-tags" "python2-django-formtools" "python2-treebeard" "python2-django-sekizai" "python2-djangocms-admin-style")

    cd $_name-$pkgver-py2
    python2 setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
}
