# Maintainer: Agorgianitis Loukas <agorglouk@gmail.com>
pkgname=glslviewer-git
pkgver=r314.765aed8
pkgrel=1
pkgdesc="Live GLSL coding render for MacOS and Linux"
arch=('i686' 'x86_64')
url="https://github.com/patriciogonzalezvivo/glslViewer"
license=('BSD-3-Clause')
depends=('glfw')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("$pkgname::git+https://github.com/patriciogonzalezvivo/glslViewer")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-VCS}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${pkgname%-VCS}"
    make
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 bin/glslViewer "$pkgdir/usr/local/bin/glslviewer"
    install -D -m755 bin/glslLoader "$pkgdir/usr/local/bin/glslloader"
}
