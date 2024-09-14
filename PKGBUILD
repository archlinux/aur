# Maintainer: Frank Sacco <franka25sacco at gm@il dot com>

pkgname=videocondenser-git
pkgver=r24.05cc4dc
pkgrel=1
pkgdesc="A tool that condenses videos by adjusting playback speed based on volume."
arch=('x86_64')
url="https://github.com/frank-monkey/videocondenser"
license=('GPL')
depends=(
    'python'
    'python-numpy'
    'python-audiotsm'
    'python-scipy'
    'ffmpeg'
    'python-ffmpeg-python'
)
makedepends=(
    'python-poetry-core'
    'python-build'
    'python-installer'
    'python-wheel'
    'git'
)
source=("${pkgname}::git+https://github.com/frank-monkey/videocondenser.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
