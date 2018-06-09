# Maintainer: Brayden Banks <bb010g@gmail.com>
pkgname=vf-1-git
pkgver=r168.507ebcf
pkgrel=1
pkgdesc="Command line gopher client. High speed, low drag. (Git version)"
arch=('any')
url="https://github.com/solderpunk/VF-1"
license=('BSD')
depends=('python')
makedepends=('git' 'python-setuptools')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('vf-1::git+https://github.com/solderpunk/VF-1.git')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${pkgname%-git}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -D -m644 "$srcdir/${pkgname%-git}/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 "$srcdir/${pkgname%-git}/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

    cd "$srcdir/${pkgname%-git}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
