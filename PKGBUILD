pkgname=dualsensectl
pkgver=0.4
pkgrel=1
pkgdesc='Tool for controlling Sony PlayStation 5 DualSense controller on Linux'
arch=('x86_64')
conflicts=('dualsensectl-git')
url='https://github.com/nowrep/dualsensectl'
license=('GPL2')
depends=('dbus' 'hidapi')
makedepends=('make' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nowrep/dualsensectl/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('bb82b49835e6ccd5bc78d36b16acdd0aa15dc8a27564afba4c0132915150f22fa1011850449e068f008b24567b863ea6dc6585d726a33b164a93d82990095790')

build() {
    make -C "$pkgname-$pkgver"
}

package() {
    make -C "$pkgname-$pkgver" DESTDIR="$pkgdir" install
}

install() {
    $(CC) main.c -o $(TARGET) $(DEFINES) $(CFLAGS) $(LIBS)
    install -D -m 755 -p $(TARGET) $(DESTDIR)/usr/bin/$(TARGET)
    install -D -m 755 -p completion/$(TARGET) $(DESTDIR)/usr/share/bash-completion/completions/$(TARGET)
    install -D -m 755 -p completion/_$(TARGET) $(DESTDIR)/usr/share/zsh/site-functions/_$(TARGET)
}
