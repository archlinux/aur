# Maintainer: Faulaner <kontakt-arch-aur at afaul dot de>

pkgname="another-swayrst"
pkgdesc="Restore workspaces, layout and window size in sway to displays"
pkgver=1.0.2
pkgrel=1
arch=('any')
url="https://github.com/afaul/another-swayrst"
license=('GPL-3.0-or-later')
depends=("python" "python-i3ipc" "python-click" "python-psutil" "python-pydantic")
makedepends=( "python-build" "python-installer" "python-pdm-backend" )
provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}")
#replaces=("${pkgname}")
source=("$pkgname-$pkgver.tar.gz::https://github.com/afaul/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('70cfa2fc0dc807371e4b4d6622b5a91237118d961a1f099648fa9bbbe98aab97')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    PDM_BUILD_SCM_VERSION=${pkgver} python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

