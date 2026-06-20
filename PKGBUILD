# Maintainer: mfw <espadonne@outlook.com>

pkgname=ftop-tui
provides=('ftop')
conflicts=('ftop')
pkgver=0.1.0
pkgrel=1
pkgdesc='TUI system monitor in Fortran 2018 with truecolor, braille graphs, and GPU monitoring'
arch=('x86_64' 'aarch64')
url='https://github.com/FortranGoingOnForty/ftop'
license=('MIT')
depends=('glibc')
makedepends=('gcc-fortran' 'cmake')
source=(
    "git+https://github.com/FortranGoingOnForty/ftop.git#tag=v$pkgver"
    "git+https://github.com/FortranGoingOnForty/fgof-temp.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-pty.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-screen.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-termios.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-keys.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-lineedit.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-fs.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-process.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-watch.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-state.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-cache.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-expect.git#tag=v0.2.0"
    "git+https://github.com/FortranGoingOnForty/fgof-toml.git#tag=v0.1.0"
)
sha256sums=(
    'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
    'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
)

build() {
    cmake -B build -S "$srcdir/ftop" \
        -DCMAKE_BUILD_TYPE=Release \
        -DFTOP_FGOF_ROOT="$srcdir" \
        -DBUILD_TESTING=OFF
    cmake --build build
}

check() {
    "$srcdir/build/bin/ftop" --version
}

package() {
    install -Dm755 "$srcdir/build/bin/ftop" "$pkgdir/usr/bin/ftop"
    install -Dm644 "$srcdir/ftop/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/ftop/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
