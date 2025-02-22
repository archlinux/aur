pkgbase='python-moviepy'
pkgname=('python-moviepy')
_module='moviepy'
pkgver='2.1.2'
pkgrel=1
pkgdesc="Video editing with Python"
url="https://zulko.github.io/moviepy/"
depends=('python' 'python-decorator' 'python-numpy' 'python-pillow' 'python-imageio' 'python-proglog' 'python-imageio-ffmpeg')
depends+=('python-tqdm') # needed by python-proglog https://aur.archlinux.org/packages/python-proglog#comment-1012622
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('22c57a7472f607eaad9fe80791df67c05082e1060fb74817c4eaac68e138ee77')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
	rm -rfv "tests/"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
