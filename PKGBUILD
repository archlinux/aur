# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=1.5.1
pkgrel=1
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=('python' 'python-arrow' 'python-click' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("https://github.com/TailorDev/Watson/archive/${pkgver}.tar.gz")
sha256sums=('e443b7e087b100eddb267bd2f60a5c0f29da3e517f1fe3d0734cdd8e2b46df80')

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
