# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=2.0.1
pkgrel=2
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=(
    'python'
    'python-arrow'
    'python-click>=7.0' 'python-click<8.0'
    'python-click-didyoumean'
    'python-requests'
)
makedepends=('python-setuptools')
options=(!emptydirs)

source=("$pkgname-$pkgver.tar.gz::https://github.com/TailorDev/Watson/archive/$pkgver.tar.gz")
sha256sums=('c0915b9140ad292207f216ed9502029ef7c54e671c279310a516576925012592')

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
