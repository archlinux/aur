# Maintainer: Nero Blackstone <gf7600gs@gmail.com>

pkgname=oxen-bin
pkgver=0.68.2
pkgrel=1
pkgdesc="Oxen CLI. Oxen is a lightning fast data version control system for structured and unstructured machine learning datasets."
arch=('x86_64')
url="https://www.oxen.ai/"
license=('Apache-2.0')
source=("https://github.com/Oxen-AI/Oxen/releases/download/v${pkgver}/oxen-linux-x86_64.deb")
sha256sums=('dcf5bd3ad8dccc6dfb11a94b0fced7d911b7336eaf78cef29078f672a0347d41')

prepare() {
    cd "$srcdir"
    ar x oxen-linux-x86_64.deb
    tar -xf data.tar.*
    tar -xf control.tar.* || true
    find . -type d -exec chmod 755 {} +
    find . -type f -exec chmod 644 {} +
    chmod 755 usr/bin/* 2>/dev/null || true
    chmod 755 usr/sbin/* 2>/dev/null || true
}

package() {
    cd "$srcdir"
    cp -r * "$pkgdir/"
}