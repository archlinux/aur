# Maintainer: Vlad Glagolev <scm(at)vaygr(dot)net>

pkgname=markdown-editor
_name=Markdown-Editor
pkgver=1.0.7
pkgrel=1
pkgdesc="standalone editor for your local markdown files"
arch=('any')
url="https://github.com/ncornette/Python-Markdown-Editor"
license=('MIT')
depends=('python' 'python-markdown' 'python-bottle' 'python-pygments' 'pymdown-extensions')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz"
        'editor.patch')
sha256sums=('25161686b18889249847570727a69e9cba8383754f279f4baaf4113deb3fbe52'
            'fb4fca31312f795006d5c01332d9e367f56b7d7f2c6f31c2c9155a0bf7f377c2')

prepare() {
  cd "${_name}-${pkgver}"

  patch -p0 < ../editor.patch
}

build() {
  cd "${_name}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_name}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
}
