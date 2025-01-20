pkgname=singletask
pkgver=1.1.4
pkgrel=2
pkgdesc="A compact, single-task-focused application for managing tasks and thoughts."
arch=('any')
url="https://topheim.com"
license=('MIT')
depends=('python' 'tk')
makedepends=('python-setuptools')
reponame=("singletask")
source=("https://codeload.github.com/atopheim/${reponame}/tar.gz/refs/tags/v${pkgver}")
# sha256sums=('67b602d79aee563e10d8a403efee9b0cdf8e63c77dd4a791031c2bae4d51f187')

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
sha256sums=('67b602d79aee563e10d8a403efee9b0cdf8e63c77dd4a791031c2bae4d51f187')
