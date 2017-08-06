# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=1.5.0
pkgrel=1
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url='https://tailordev.github.io/Watson/'
license=('MIT')
depends=('python' 'python-arrow' 'python-click' 'python-requests')
makedepends=('python-setuptools')
options=(!emptydirs)

source=("https://github.com/TailorDev/Watson/archive/${pkgver}.tar.gz")
sha256sums=('1ac7594bd5d08eeb3d921715c360467a0c420b406323e305a2051c864cafa40b')

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
