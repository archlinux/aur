# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=2.1.0
pkgrel=1
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=(
    'python'
    'python-arrow'
    'python-click'
    'python-click-didyoumean'
    'python-requests'
)
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/TailorDev/Watson/archive/$pkgver.tar.gz")
sha256sums=('ba0d23a1437e022f7d331c5a5923e24b3996099a4e140edeb5785f992e0b705b')

build() {
    cd "$srcdir/Watson-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/Watson-$pkgver"

    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 watson.completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -D -m 644 watson.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
    install -D -m 644 watson.fish "$pkgdir/usr/share/fish/completions/$pkgname.fish"

    python setup.py install --root="$pkgdir" --optimize=1
}
