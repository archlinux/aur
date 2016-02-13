# Maintainer: Miodrag Tokić

pkgname=watson
pkgver=1.3.1
pkgrel=1
pkgdesc='A wonderful CLI to track your time!'
arch=('any')
url="https://tailordev.github.io/Watson/"
license=('MIT')
groups=()
depends=('python' 'python-arrow' 'python-click' 'python-requests')
makedepends=('python-setuptools')
provides=()
conflicts=()
replaces=()
backup=()
options=(!emptydirs)

source=("https://github.com/TailorDev/Watson/archive/${pkgver}.tar.gz")
sha256sums=('de7190f8cb304004b096be1b5992eb826306da75cbaa04fd588ab113c08e0250')

build() {
    cd "$srcdir/Watson-${pkgver}"
    sed -i '/pytest-runner/d' requirements.txt
    python setup.py build
}

package() {
    cd "$srcdir/Watson-${pkgver}"
    install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -D -m 644 watson.completion "${pkgdir}/usr/share/bash-completion/completions/${pkgname}"
    python setup.py install --root="${pkgdir}" --optimize=1
}
