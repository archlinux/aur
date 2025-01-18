pkgname=singletask
pkgver=1.1.4
pkgrel=1
pkgdesc="A compact, single-task-focused application for managing tasks and thoughts."
arch=('any')
url="https://topheim.com"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-setuptools')
reponame=("singletask")
source=("https://codeload.github.com/atopheim/${reponame}/tar.gz/refs/tags/v${pkgver}")
sha256sums=('1')

build() {
    cd "$srcdir/${reponame}-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/${reponame}-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1

    # Create a shell script for launching the app
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/singletask" << EOF
#!/bin/bash
exec python -m singletask "\$@"
EOF
}
