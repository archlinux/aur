# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shillelagh"
_pkgname="${pkgname/python-/}"
pkgver=1.4.5
pkgrel=1
pkgdesc="Making it easy to query APIs via SQL"
url="https://github.com/betodealmeida/shillelagh/"
license=("MIT")
arch=("any")
depends=("python"
         "python-apsw"
         "python-dateutil"
         "python-requests"
         "python-requests-cache"
         "python-sqlalchemy"
         "python-greenlet"
         "python-typing_extensions"
        )
makedepends=("python-build"
             "python-installer"
             "python-wheel"
             "python-setuptools"
             "python-setuptools-scm"
             "python-pyscaffold")
options=("!strip")
source=("https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pkgname/-/_}-${pkgver}.tar.gz")
b2sums=('c9b1d71734fda175671dadc1233dfc9c0253036b36e36b07e1f0e7263cea21f2fcd09cb19c567c783862e7145c6dc57543727f92246193de77cb797ec1d85c34')

prepare(){
 cd "${_pkgname/-/_}-$pkgver"
 sed -i "setup.cfg" \
     -e "s|author-email|author_email|" \
     -e "s|long-description-content-type|long_description_content_type|" \
     -e "s|long-description|long_description|" \
     -e "s|project-urls|project_urls|" \
     -e "s|setup_requires = pyscaffold.*||"
     
 sed -i "pyproject.toml" \
     -e "s|requires =.*|requires = ['setuptools']|"
}

build(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m build --wheel --no-isolation
}

package(){
 cd "${_pkgname/-/_}-$pkgver"
 python -m installer --destdir="$pkgdir" dist/*.whl
}
