# Maintainer: yusufprompt <yusufygz23@gmail.com>
pkgname=s-console
pkgver=1.0
pkgrel=1
pkgdesc="A super fast GTK3/VTE terminal emulator for Arch Linux"
arch=('x86_64')
url="https://github.com"
license=('GPL')
depends=('gtk3' 'vte3' 'fastfetch')
makedepends=('gcc' 'pkg-config' 'git')

# KRİTİK DEĞİŞİKLİK: Yerel dosya yerine GITHUB reponu ekledik
# PKGBUILD içindeki source satırı tam olarak bu olmalı:
source=("s-console::git+https://github.com/yusufprompt/s-console.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/s-console"
    gcc terminal.c -o s-console `pkg-config --cflags --libs gtk+-3.0 vte-2.91`
}

package() {
    cd "$srcdir/s-console"
    
    # Binary
    install -Dm755 s-console "${pkgdir}/usr/bin/s-console"
    
    # Masaüstü dosyası ve İkon
    install -Dm644 s-console.desktop "${pkgdir}/usr/share/applications/s-console.desktop"
    install -Dm644 logo.png "${pkgdir}/usr/share/icons/hicolor/512x512/apps/s-console.png"
    
    # Konfigürasyon dosyası
    install -Dm644 s-console.conf "${pkgdir}/etc/s-console/s-console.conf"
}

