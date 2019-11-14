# Maintainer: Kevin Azzam <aur@azz.am>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname='python-django-storages'
_module='django-storages'
pkgver='1.7.2'
pkgrel=1
pkgdesc="Support for many storage backends (S3, Libcloud, etc) in Django."
url="https://github.com/jschneier/django-storages"
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/d/django-storages/django-storages-${pkgver}.tar.gz")
sha256sums=('f3b3def96493d3ccde37b864cea376472baf6e8a596504b209278801c510b807')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django')
    optdepends=('python-boto3')

    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 CHANGELOG.rst -t "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"
}
