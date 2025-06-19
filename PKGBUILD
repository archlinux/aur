pkgbase='python-moviepy'
pkgname=('python-moviepy')
_module='moviepy'
pkgver='2.2.1'
pkgrel=1
pkgdesc="Video editing with Python"
url="https://github.com/Zulko/moviepy/"
depends=('python' 'python-decorator' 'python-numpy' 'python-pillow' 'python-imageio' 'python-proglog' 'python-imageio-ffmpeg')
depends+=('python-tqdm') # needed by python-proglog https://aur.archlinux.org/packages/python-proglog#comment-1012622
makedepends=('python-build' 'python-installer' 'python-setuptools')
license=('MIT')
arch=('any')
source=("https://files.pythonhosted.org/packages/source/${_module::1}/$_module/$_module-$pkgver.tar.gz")
sha256sums=('c80cb56815ece94e5e3e2d361aa40070eeb30a09d23a24c4e684d03e16deacb1')

build() {
    cd "${srcdir}/${_module}-${pkgver}"
	rm -rfv "tests/"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
