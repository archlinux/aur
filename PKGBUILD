pkgname='magicpodscore-git'
pkgver=2.0.4.r0.g565cbba
pkgrel=1
pkgdesc='A command-line utility for managing AirPods, Beats, and Galaxy Buds.'
url='https://github.com/steam3d/MagicPodsCore'
arch=('x86_64')
license=('GPL-3.0-only')
source=(
    'git+https://github.com/steam3d/MagicPodsCore.git'
    'LICENSE::https://raw.githubusercontent.com/steam3d/MagicPodsCore/refs/heads/master/LICENSE'
)
sha256sums=('SKIP' 'SKIP')
makedepends=('git' 'docker' 'docker-buildx')

pkgver() {
    cd "$srcdir/MagicPodsCore"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/MagicPodsCore"
    ./rundocker.sh
}

package() {
    install -Dm755 "$srcdir/MagicPodsCore/MagicPodsCore" "$pkgdir/usr/bin/MagicPodsCore"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
