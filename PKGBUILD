# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

_pkgname=ara
pkgname=python-${_pkgname}
pkgver=1.6.1
pkgrel=1
pkgdesc="ARA Records Ansible and makes it easier to understand and troubleshoot."
arch=("any")
url="https://github.com/ansible-community/ara"
license=('GPL-3.0')
depends=("python-cliff"
         "python-pbr"
         "python-requests")
provides=("ara")
optdepends=(
    "python-django"
    "python-django-rest-framework"
    "python-django-cors-headers"
    "python-django-filter"
    # FIXME: still require following packages
    # "django-health-check"
    # "python-dynaconf"
    "python-tzlocal"
    "python-whitenoise"
    "python-pygments"
    "python-psycopg2"
    )
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/d8/21/64905ea535a94e72508b0a3a7d0fae28ac420f1db63729d660dd29c22a4d/ara-${pkgver}.tar.gz")
sha256sums=('90812ee38308b87db357d34f9fd9dd422c87edb3cdc0248a83f65b1bf0691b6d')

build() {
    cd ${_pkgname}-${pkgver}
    python setup.py build
}

package() {
    local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")

    cd ${_pkgname}-${pkgver}
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    # rm -rf "${pkgdir}${site_packages}/test"
    install -Dm644 LICENSE "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
