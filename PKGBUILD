# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=1.4.0
pkgrel=2
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=('python' 'python-arrow' 'python-click' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("https://github.com/TailorDev/Watson/archive/${pkgver}.tar.gz")
sha256sums=('651869e76a2c135de7c3bc7a0ebedd5f2a6d3142f648534b150c6c64531361cc')

build() {
    cd "$srcdir/Watson-${pkgver}"

    python setup.py build
}

package() {
    cd "$srcdir/Watson-${pkgver}"

    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 watson.completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    install -D -m 644 watson.zsh-completion "${pkgdir}/usr/share/zsh/site-functions/_${pkgname}"

    python setup.py install --root="${pkgdir}" --optimize=1
}
