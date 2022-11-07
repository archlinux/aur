# Maintainer: Chris Down <chris@chrisdown.name>

pkgname=clipnotify-git
_gitname=clipnotify
pkgver=1.0.2.r5.g9c23a8b
pkgrel=1
pkgdesc='Polling-free clipboard notifier'
url='http://github.com/cdown/clipnotify'
arch=('x86_64')
license=('custom:Public Domain')
depends=(libx11 libxfixes)
provides=(clipnotify)
conflicts=(clipnotify)

source=(git+https://github.com/cdown/clipnotify.git)
md5sums=('SKIP')

pkgver() {
    cd "${srcdir?}/$_gitname"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${srcdir}/$_gitname"
    true
}

build() {
    cd "${srcdir}/$_gitname"
    make
}

package() {
    cd "${srcdir}/$_gitname"
    install -Dm755 clipnotify "${pkgdir}/usr/bin/clipnotify"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
