pkgname='biblestudytools-git'
pkgver=0.1.0.r40.ge49c51d
pkgrel=1
pkgdesc='An ncurses client to biblestudytools.com'
license=('MIT')
url='https://github.com/kevr/biblestudytools'

arch=('i686' 'x86_64' 'armv6h')
depends=('python' 'python-requests' 'python-lxml')
optdepends=('wl-clipboard')
makedepends=('git' 'python' 'python-build' 'python-installer' 'python-wheel' 'python-requests' 'python-lxml')
conflicts=("${pkgname%-git}")
source=("git+${url}")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${pkgname%-git}"
    python -m build --wheel --no-isolation
}

package()
{
    cd "${pkgname%-git}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

