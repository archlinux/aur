# Maintainer: Rodrigo Tavares <rodrigost23@gmail.com>

pkgname=meowgram-git
pkgver=r344.0785a79
pkgrel=1
pkgdesc='Telegram client written in GTK & Python'
arch=('x86_64' 'i686')
url='https://github.com/ExposedCat/Meowgram'
depends=('python' 'python-gobject' 'python-telethon' 'python-bleach' 'gtk4' 'libadwaita' 'gnome-keyring')
makedepends=('git' 'meson')
license=('GPL3')
source=('git+https://github.com/ExposedCat/Meowgram.git')
sha512sums=('SKIP')

pkgver() {
    cd "$srcdir/Meowgram"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/Meowgram"
    meson builddir \
        --prefix=/usr
    ninja -C builddir
}

package() {
    cd "$srcdir/Meowgram"
    DESTDIR="${pkgdir}" ninja -C builddir install
}
