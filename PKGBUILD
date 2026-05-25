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
sha512sums=('a95e7746d5995974f01f87f690d5321ee48b5ae964e5b135e647bb105444c7306407aa967758bd638f4bc9ce75d12d7e2606de07c629e403862a0e0ff22830a4')

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