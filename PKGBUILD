# Maintainer: Jeffrey Zhang <zhang.lei.fly@gmail.com>

_pkgname=ara
pkgname=python-${_pkgname}
pkgver=1.5.7
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
source=("https://files.pythonhosted.org/packages/f2/7f/ea50ae0975f4adbc7f02a520ea30b831e3c3cc1b48cab82a5f9386cec0b3/ara-${pkgver}.tar.gz")
sha256sums=('4a6883dad5e0d119a754271338948cb1119c2c5b36d48b162d610e348eccb502')

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
