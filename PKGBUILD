# Maintainer: Jakob Gerhard Martinussen <jakobgm at gmail dot com>
pkgname=astrality-git
pkgver=0.6.r130.g589b228
pkgrel=1

pkgdesc='templates-based configuration file manager'
url='https://astrality.readthedocs.io'
arch=('any')
license=('MIT')

depends=('python')
makedepends=('python-setuptools' 'git' 'sed')
optdepends=('libyaml: faster YAML config parsing')

provides=('astrality')
conflicts=('astrality')

source=('astrality::git+https://github.com/JakobGM/astrality.git')
sha256sums=('SKIP')

pkgver() {
    cd astrality
    git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd astrality
    python setup.py build
}

package() {
    cd astrality
    python setup.py install --root="$pkgdir" --optimize=1 --skip-build
    install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
