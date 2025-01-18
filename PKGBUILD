pkgname=singletask
pkgver=1.1.3
pkgrel=5
pkgdesc="A compact, single-task-focused application for managing tasks and thoughts."
arch=('any')
url="https://topheim.com"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-setuptools')
source=("https://codeload.github.com/atopheim/python-singletask/tar.gz/refs/tags/v${pkgver}")
sha256sums=("bd287b9edddc21e67d48fc655886aa191ee5a121ad0748c52fcb09b74a6cc300")

build() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1

    # Create a shell script for launching the app
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/singletask" << EOF
#!/bin/bash
exec python -m singletask "\$@"
EOF
}
