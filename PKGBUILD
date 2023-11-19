# Maintainer: Mubashshir <ahmubashshir@gmail.com>
# from: pypi
# what: PyGLM

pkgname='python-pyglm'
pkgver='2.7.1'
pkgrel=1
pkgdesc="OpenGL Mathematics library for Python"
url="https://github.com/Zuzu-Typ/PyGLM"
depends=('python')
makedepends=('python-setuptools' 'git')
license=('ZLIB')
arch=('any')
source=(
    "$pkgname::git+https://github.com/Zuzu-Typ/PyGLM.git#tag=$pkgver"
    "pyglm-typing::git+https://github.com/esoma/pyglm-typing.git"
    "glm::git+https://github.com/Zuzu-Typ/glm.git"
)
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

prepare() {
    local mod

    cd "$srcdir/$pkgname"
    git submodule init
    for mod in glm pyglm-typing; do
        git config "submodule.$mod.url" "$srcdir/$mod"
    done

    git -c protocol.file.allow=always submodule update
}

build() {
    cd "$srcdir/$pkgname"
    CFLAGS="$CFLAGS -Wno-all" python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build
}
