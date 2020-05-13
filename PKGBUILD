# Maintainer: pvdp <pvdp at email dot com>
# Contributor: hcra <hcra at u53r dot space>
# Contributor: Pico Paco Nano <founderofjp@gmail.com>
# Contributor: felix.s <felix.von.s@posteo.de>

pkgname=qweborf
_pkgname=weborf
pkgver=0.16
pkgrel=1
pkgdesc="Minimal HTTP server to share your files - Qt frontend"
arch=(any)
url="https://ltworf.github.io/weborf"
license=(GPL3)
depends=('python' 'weborf' 'desktop-file-utils')
makedepends=('python-pyqt5' 'python-setuptools')
conflicts=("$pkgname-git")
source=(https://github.com/ltworf/weborf/releases/download/$pkgver/weborf_$pkgver.orig.tar.gz)
sha256sums=('a0d1c181fd344268600c76d8cfd773b5f5cd9662a401bb3a8b4b038de19426d6')

build() {
    cd "$srcdir/$_pkgname-$pkgver/qweborf"

    pyuic5 qweborf/main.ui > qweborf/main.py
    python setup.py build
}

package() {
    cd "$srcdir/$_pkgname-$pkgver/qweborf"

    python qweborf.setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm 0755 qweborf/qweborf "$pkgdir/usr/bin/qweborf"
    install -Dm 0755 integration/qweborf.desktop "$pkgdir/usr/share/applications/qweborf.desktop"
}
