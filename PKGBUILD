# Contributor: Łaurent ʘ❢Ŧ Ŧough <laurent dot fough at gmail dot com>

pkgname=xkcd-git
pkgver=r56.9c26c67
pkgrel=2
epoch=1
pkgdesc='CLI tool to fetch XKCD comics'
url='https://github.com/itsron717/XKCD'
depends=('python-click' 'python-pillow' 'python-requests')
makedepends=('git' 'python-setuptools' 'python-build' 'python-installer' 'python-wheel')
optdepends=(
    'python-sh: to display the XKCD banner'
    'lolcat: to display the XKCD banner'
    'figlet: to display the XKCD banner'
)
license=('MIT')
arch=('any')
provides=("xkcd")
conflicts=("xkcd")
sha256sums=('SKIP')
source=("${pkgname}::git+${url}")

pkgver() {
    cd ${pkgname}
    printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
    cd ${pkgname}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
