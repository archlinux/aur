# Maintainer: Kevin Azzam <aur@azz.am>
# Contributor: David McInnis <davidm@eagles.ewu.edu>

pkgname='python-django-storages'
_module='django-storages'
pkgver='1.14.4'
pkgrel=1
pkgdesc="Support for many storage backends (S3, Libcloud, etc) in Django."
url="https://github.com/jschneier/django-storages"
makedepends=('python-setuptools')
license=('BSD')
arch=('any')
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('80fa01c2e8f10276dbea5cbd9f8a6dc2c17a5fa603d8f23e9c7cbbf3070a0d2f')

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
