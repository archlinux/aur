# Maintainer: Jakob Gerhard Martinussen <jakobgm at gmail dot com>
pkgname=astrality-git
pkgver=1.0.1.r0.g48ab0aa
pkgrel=3
pkgdesc='templates-based configuration file manager'
arch=('any')
url='https://astrality.readthedocs.io'
license=('MIT')
depends=('python'
         'python-astral'
         'python-coloredlogs'
         'python-dateutil'
         'python-jinja'
         'python-mypy_extensions'
         'python-requests'
         'python-watchdog-git'
         'python-yaml'
         'python-psutil')
optdepends=('libyaml: faster YAML config parsing')
makedepends=('python-setuptools'
             'git'
             'sed')

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
