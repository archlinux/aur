# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=1.7.0
pkgrel=2
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=('python' 'python-arrow' 'python-click' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/TailorDev/Watson/archive/$pkgver.tar.gz")
sha256sums=('b4d4d1a45f04e57fb00aeac0caf1003bb402dfc2cb0989a3b167ed2611077a54')

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
