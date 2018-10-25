# Maintainer: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: Kazutoshi Noguchi <noguchi.kazutosi+lGlcOenS [at] gmail [dot] com>
# Contributor: Marco Kundt <mrckndt [at] gmail [dot] com>

pkgname=gtk3-nocsd-git
pkgver=r55.82ff5a0
pkgrel=4
pkgdesc="A hack to disable gtk+ 3 client side decoration"
arch=("i686" "x86_64")
url="https://github.com/PCMan/gtk3-nocsd"
license=("LGPL")

depends=("gtk3")
conflicts=("gtk3-nocsd")

makedepends=(
    "git"
    "gobject-introspection"
)

source=(
    "git+https://github.com/PCMan/gtk3-nocsd.git"
    "30-gtk3-nocsd.sh"
)

sha512sums=(
    "SKIP"
    "734e9ecd74fa677e185af9f91ac0abbc99bc55c1405aaaff219e24a5ceba7e6bff658ff428bde3dcb41a5c8a17b4cc8fb68abfed79306404941290ee1324c170"
)

install="$pkgname.install"

_gitname="gtk3-nocsd"

pkgver() {
    cd "$srcdir/$_gitname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_gitname"
    make
}

package() {
    cd "$srcdir/$_gitname"
    install -D -m 0755 gtk3-nocsd "${pkgdir}"/usr/bin/gtk3-nocsd
    install -D -m 0644 gtk3-nocsd.1 "${pkgdir}"/usr/share/man/man1/gtk3-nocsd.1
    install -D -m 0644 gtk3-nocsd.bash-completion "${pkgdir}"/usr/share/bash-completion/completions/gtk3-nocsd

    install -D -m 0644 libgtk3-nocsd.so.0 "${pkgdir}"/usr/lib/libgtk3-nocsd.so.0

    cd "$srcdir"
    install -D -m 0755 30-gtk3-nocsd.sh "${pkgdir}"/etc/X11/xinit/xinitrc.d/30-gtk3-nocsd.sh
}
