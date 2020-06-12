# Maintainer: csantosb <csantosb dot inventati dot org>
pkgname=python-vsg-git
pkgver=r1251.960fc7d
pkgrel=1
pkgdesc="VHDL style guide: coding style enforcement for VHDL"
arch=('any')
url="https://github.com/jeremiah-c-leary/vhdl-style-guide/"
license=('GPLv3')
conflicts=('python-vsg')
provides=('python-vsg-git')
depends=('python' 'python-setuptools')

makedepends=('git')

options=(!emptydirs)
source=("git+https://github.com/jeremiah-c-leary/vhdl-style-guide")
md5sums=('SKIP')

build() {
    cd "${srcdir}/vhdl-style-guide"
    python setup.py build
}

package() {
    depends=('python-pyaml')
    cd "${srcdir}/vhdl-style-guide"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -m 644 -D ./LICENSE "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}

pkgver() {
    cd "${srcdir}/vhdl-style-guide"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}