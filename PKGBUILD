# Maintainer: Brett Cornwall <ainola@archlinux.org>
# Contributor: Sergey Mastykov

pkgname=linkchecker
pkgver=10.1.0
pkgrel=1
pkgdesc="Check websites for broken links."
arch=('any')
url="https://github.com/linkcheck/linkchecker"
license=('GPL2')
makedepends=(
    'python-polib'
    'python-pytest'
    'python-setuptools'
    'python-pip'  # FIXME: why?
)
depends=(
    'python-requests'
    'python-dnspython'
    'python-xdg'
    'python-beautifulsoup4'
)
optdepends=(
    'python-argcomplete: For command-line completion'
)
# GitHub releases are not recommended by upstream (and fail to build anyway).
source=("$pkgname-$pkgver.tar.gz::https://files.pythonhosted.org/packages/source/L/LinkChecker/LinkChecker-$pkgver.tar.gz")
sha256sums=('ea9354665341c9f1650b6bb716a64d2022635e7fa38e5e05280ba79a57c237b2')

build() {
    cd "LinkChecker-$pkgver"
    python setup.py build
}

package() {
    cd "LinkChecker-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
}
