# Maintainer: Sam Collier <samcollier916@gmail.com>
pkgname=ue4-docker
pkgver=0.0.116
pkgrel=1
pkgdesc="Windows and Linux containers for Unreal Engine"
arch=('any')
url="https://github.com/adamrehn/ue4-docker"
license=('MIT')
depends=(
    'python>=3.8'
    'python-colorama'
    'python-docker>=6.1.0'
    'python-humanfriendly'
    'python-jinja>=2.11.3'
    'python-packaging>=19.1'
    'python-psutil'
    'python-termcolor'
    'docker'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-setuptools>=61'
)
optdepends=(
    'nvidia-container-toolkit: for GPU support in Linux containers'
    'ue4cli-git: for additional UE4 command-line tools'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/adamrehn/ue4-docker/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e28aa5791b3900910fc18699c392627801421e46aedc18246d5f32ba1599803f')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    
    python -m installer --destdir="$pkgdir" dist/*.whl
    
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    
    if [ -d "docs" ]; then
        cp -r docs "$pkgdir/usr/share/doc/$pkgname/"
    fi
}
