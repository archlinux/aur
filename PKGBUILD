# Maintainer: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgbase='nexus3-cli'
pkgname='nexus3-cli'
pkgver='4.1.0'
pkgrel=1
pkgdesc="A python-based CLI for Sonatype Nexus OSS 3"
url="https://gitlab.com/thiagocsf/nexus3-cli"
depends=('python' 'python-inflect' 'python-clint' 'python-semver')
makedepends=('python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('91dc505661407f3d70cf4e99c8af87bd813f7c417bceba8878c53d29712e0712')

prepare() {
    # patching package inflect
    sed -i 's|inflect>=4.1.0,<5|inflect>=4.1.0,<6|g' */setup.py
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    depends+=()
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
