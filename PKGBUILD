# Maintainer: Thibault 'Ryp' Schueller <ryp.sqrt@gmail.com>

_gitname=Vulkan-Docs
pkgname=vulkan-man-git
pkgver=v1.1.89.r2.g969db8e
pkgrel=1
pkgdesc="Vulkan API specs man pages (unofficial support)"
arch=('any')
license=('custom')
url="https://www.khronos.org/registry/vulkan/#apispecs"
makedepends=('git' 'make' 'asciidoctor>=1.5.8')
conflicts=('vulkan-man')
provides=('vulkan-man')
source=("git+https://github.com/Ryp/${_gitname}.git")
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_gitname"
    make manpages
}

package() {
    cd "$srcdir/$_gitname"

    install -d "${pkgdir}/usr/share/man/man3"
    install -m 644 out/man/* "${pkgdir}/usr/share/man/man3"

    install -Dm 644 COPYING.md "${pkgdir}/usr/share/licenses/${_gitname}/LICENSE"
}
