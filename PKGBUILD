# Maintainer: Kevin Azzam <aur@azz.am>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname='python-django-storages'
_module='django-storages'
pkgver='1.14.2'
pkgrel=1
pkgdesc="Support for many storage backends (S3, Libcloud, etc) in Django."
url="https://github.com/jschneier/django-storages"
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/d/django-storages/django-storages-${pkgver}.tar.gz")
sha256sums=('51b36af28cc5813b98d5f3dfe7459af638d84428c8df4a03990c7d74d1bea4e5')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    depends=('python-django')
    optdepends=(
        'python-azure-storage-blob'
        'python-boto3'
        'python-dropbox'
        'python-google-cloud-storage'
        'python-apache-libcloud'
        'python-paramiko'
    )

    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}/" --optimize=1

    install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 644 CHANGELOG.rst -t "${pkgdir}/usr/share/doc/${pkgname}/CHANGES"
}
