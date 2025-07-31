# PKGBUILD

# Maintainer: Daniele Fucini <dfucini [at] gmail [dot] com>

pkgname=beet-summarize-git
_pkgname=beet-summarize
pkgdesc='Summarize your beets library'
pkgver=r84.993f74b
pkgrel=1
url="https://github.com/steven-murray/${_pkgname}"
arch=('any')
license=('LGPL-3.0-only')
makedepends=('git'
             'python-setuptools-scm'
             'python-build'
             'python-installer')
depends=('python>=3.8'
         'beets>=1.5.0')
source=(git+${url}.git?branch=master)
sha256sums=('SKIP')

pkgver() 
{  
    cd ${_pkgname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare()
{
    git -C ${srcdir}/${_pkgname} clean -dfx
}

build()
{
    cd ${srcdir}/${_pkgname}
    python -m build --wheel --no-isolation
}

package()
{
    cd ${srcdir}/${_pkgname}
    python -m installer --destdir=${pkgdir} dist/*.whl
    rm "${pkgdir}"/usr/lib/python3.13/site-packages/beetsplug/__init__.py
    rm "${pkgdir}"/usr/lib/python3.13/site-packages/beetsplug/__pycache__/__init__.cpython-313.opt-1.pyc
    rm "${pkgdir}"/usr/lib/python3.13/site-packages/beetsplug/__pycache__/__init__.cpython-313.pyc
}
