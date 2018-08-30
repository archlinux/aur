# Maintainer: Agorgianitis Loukas <agorglouk@gmail.com>
pkgname=glslviewer-git
pkgver=r551.4858c45
pkgrel=1
pkgdesc="Live GLSL coding render for MacOS and Linux"
arch=('i686' 'x86_64')
url="https://github.com/patriciogonzalezvivo/glslViewer"
license=('BSD-3-Clause')
depends=('glfw')
makedepends=('git')
provides=("${pkgname%-VCS}")
conflicts=("${pkgname%-VCS}")
source=("$pkgname::git+https://github.com/patriciogonzalezvivo/glslViewer"
        'floating_wm_workaround.patch')
md5sums=('SKIP'
         'dd0001eb24fdf2cd1f49e83b25ba2fd7')

pkgver() {
    cd "$srcdir/${pkgname%-VCS}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/${pkgname%-VCS}"
    patch -p1 -i "$srcdir/floating_wm_workaround.patch"
}

build() {
    cd "$srcdir/${pkgname%-VCS}"
    make
}

package() {
    cd "$srcdir/${pkgname%-VCS}"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m755 examples/* -t "$pkgdir/usr/share/$pkgname/examples/"
    install -D -m755 bin/glslViewer "$pkgdir/usr/bin/glslviewer"
    install -D -m755 bin/glslLoader "$pkgdir/usr/bin/glslloader"
}
