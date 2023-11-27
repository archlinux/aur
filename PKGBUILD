# Maintainer: Václav Kubernát <sir.venceslas@gmail.com>

pkgname=necrolog-git
_gitname=necrolog
pkgver=r108.d7309e7
pkgrel=1
pkgdesc='Tiny but powerful logging for C++'
url='https://github.com/fvacek/necrolog'
arch=('i686' 'x86_64' 'armv7h')
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('git' 'cmake' 'doctest')
conflicts=('necrolog' 'necrolog-git')
provides=('necrolog')
source=('git+https://github.com/fvacek/necrolog.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
    ctest --test-dir "$srcdir/build"
}

build() {
    cmake -S "$srcdir/$_gitname" -B "$srcdir/build" -DCMAKE_INSTALL_PREFIX=/usr

    cmake --build "$srcdir/build"
}

package() {
    DESTDIR="$pkgdir" cmake --install "$srcdir/build"
    install -Dm644 necrolog/LICENSE -t "$pkgdir"/usr/share/licenses/$pkgbase
}
