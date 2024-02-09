# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="python-shillelagh"
_pkgname="${pkgname/python-/}"
pkgver=1.2.14
pkgrel=2
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
b2sums=('d89ddf8af58eca5d89488b8005a8f444db83c93f0b0f413507f25883c1abeffa7cefb6b1f132548c0ce68a6acc5babcec98efb9342c075b4b02fcc95d78c2a6c')

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
