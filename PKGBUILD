pkgname='python-wakepy'
_module='wakepy'
pkgver='1.0.0'
_src_folder="${_module}-${pkgver}"
pkgrel=1
pkgdesc="wakelock / keep-awake / stay-awake"
url="None"
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools-scm' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/d6/13/78e45a3d2cd754f95d2fca5aece046676da559b8e34e294e69bb441f18fd/wakepy-1.0.0.tar.gz")
sha256sums=('a9425e8e77e89bccfe24a70f33ecd8596b474c75ddac79310cd54f2bc92210e3')

build() {
    cd "${srcdir}/${_src_folder}"
    sed -i 's/setuptools\=\=/setuptools>=/g' pyproject.toml
    sed -i 's/setuptools_scm\=\=/setuptools_scm>=/g' pyproject.toml
    python -m build --wheel --no-isolation
}

package() {

    cd "${srcdir}/${_src_folder}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
}
