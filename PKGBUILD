# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=1.6.0
pkgrel=1
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=('python' 'python-arrow' 'python-click' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=(
    "$pkgname-$pkgver.tar.gz::https://github.com/TailorDev/Watson/archive/$pkgver.tar.gz"
)
sha256sums=(
    '34d63592e0818c5779ee993e606f2fa8d6f449b94f0a824da5f34bf15472b1ac'
)

build() {
    cd "$srcdir/Watson-$pkgver"

    python setup.py build
}

package() {
    cd "$srcdir/Watson-$pkgver"

    install -D -m 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m 644 watson.completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    install -D -m 644 watson.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

    python setup.py install --root="$pkgdir" --optimize=1
}
