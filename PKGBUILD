# Maintainer: Amplify <advikmurthy12@gmail.com>
pkgname=amplify
pkgver=0.1.3
pkgrel=1
pkgdesc="Arch Linux soundboard with PipeWire virtual microphone support"
arch=('any')
url="https://github.com/Sage563/amplify"
license=('MIT')
depends=(
    'python'
    'pipewire'
)
makedepends=(
    'python-build'
    'python-installer'
    'python-wheel'
    'python-pip'
)
optdepends=(
    'pulseaudio: alternative audio backend'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha512sums=('aae34fbe1eb3f092b030dea7e24f981f29a3bab104f6743017cf12e3e5edcaf1280378e07fbef6ebe1bd818dc2db0b508c3faefc7e1d3cd6a4801f1ea047e3ab')

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 packaging/amplify.desktop "$pkgdir/usr/share/applications/amplify.desktop"
}