# Maintainer: Jouni Rinne <l33tmmx swirlything gmail dot com>
# Contributor:  Callum Parsey <neoninteger@protonmail.com>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Kazutoshi Noguchi <noguchi.kazutosi+lGlcOenS [at] gmail [dot] com>
# Contributor: Marco Kundt <mrckndt [at] gmail [dot] com>
pkgname=gtk3-nocsd-legacy-git
pkgver=r55.82ff5a0
pkgrel=1
pkgdesc="A hack to disable gtk3 client side decoration (stable PCMan version)"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/PCMan/gtk3-nocsd"
license=('LGPL')
conflicts=('gtk3-nocsd-git')
depends=('gtk3')
makedepends=('git' 'gobject-introspection')
source=("git+https://github.com/PCMan/gtk3-nocsd.git"
        "30-gtk3-nocsd.sh"
        "gtk3-nocsd-legacy-git.install")
sha256sums=('SKIP'
            'bb3e6464ed2c0238e68755a843f976ea7843fe0476ca1092205884be0c6d7ab3'
            '7ed485dfdeef9ea8c0c0d24fbc5e13448861f0e56c11192a5b5168db35fa9255')
install=$pkgname.install
_gitname=gtk3-nocsd

pkgver() {
    cd ${srcdir}/${_gitname}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_gitname}
    make
}

package() {
    cd ${srcdir}/${_gitname}
    install -D -m 0755 gtk3-nocsd ${pkgdir}/usr/bin/gtk3-nocsd
    install -D -m 0644 gtk3-nocsd.1 ${pkgdir}/usr/share/man/man1/gtk3-nocsd.1
    install -D -m 0644 gtk3-nocsd.bash-completion ${pkgdir}/usr/share/bash-completion/completions/gtk3-nocsd
    install -D -m 0644 libgtk3-nocsd.so.0 ${pkgdir}/usr/lib/libgtk3-nocsd.so.0
    cd ${srcdir}
    install -D -m 0755 30-gtk3-nocsd.sh ${pkgdir}/etc/X11/xinit/xinitrc.d/30-gtk3-nocsd.sh
}
