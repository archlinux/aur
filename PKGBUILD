# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

_pkgname=ara
pkgname=python-${_pkgname}
pkgver=1.7.0
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
source=("https://files.pythonhosted.org/packages/8f/d7/7e26eb07b57a4b5489e4c3601c448774211c9906c9d4cc7251c041b82c05/ara-${pkgver}.tar.gz")
sha256sums=('f2623f34e8fd542ee70f82d02cc36907e11b2d306e7b548106a33157171af58c')

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
