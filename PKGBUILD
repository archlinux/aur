# Maintainer: Jonathan Matta <mattajonathan1@gmail.com>
pkgname='laser-git'
pkgver=v1.5.0.r0.g843bf6e
pkgrel=1
pkgdesc="The better ls command, configurable with lua"
arch=('x86_64')
url="https://github.com/jmattaa/laser"
license=('MIT')
depends=('lua' 'libgit2' 'glibc')
makedepends=('cmake' 'git')
source=('laser::git+https://github.com/jmattaa/laser.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/laser"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/laser"
    mkdir -p build
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    cd "$srcdir/laser"
    install -Dm755 build/lsr "$pkgdir/usr/bin/lsr"

    install -Dm644 completions/bash/lsr "$pkgdir/usr/share/bash-completion/completions/lsr"
    install -Dm644 completions/zsh/_lsr "$pkgdir/usr/share/zsh/site-functions/_lsr"
    install -Dm644 completions/fish/lsr.fish "$pkgdir/usr/share/fish/completions/lsr.fish"
}
