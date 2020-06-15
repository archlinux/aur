# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=valinor
pkgver=1.1.4
pkgrel=1
pkgdesc="Generate Project Files to Debug ELF files"
url="https://github.com/ARMmbed/valinor"
depends=('python'
         'python-pip'
         'python-yaml'
         'python-jinja'
         'python-colorama'
         'pyocd'
         'project-generator'
         'python-pyelftools'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/ARMmbed/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('8adc22d5b1ab4d3260cd4838781a43e30b3ee8a9694c529790246b6f4c56ff70e3b233250616bbcb6177a8415905690b76146015f85eee0f72cf09b3cd641fda')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"

    # Arch extra currently ships 0.26-1
    sed -i -e 's:pyelftools==0.23:pyelftools>=0.23:' setup.py

    # Arch AUR currently ships 0.9.3-1
    sed -i -e 's:project_generator>=0.8.0,<0.9.0:project_generator>=0.8.0,<0.10.0:' setup.py

    # Arch community currently ships 0.4.3-1
    sed -i -e 's:colorama>=0.3,<0.4:colorama>=0.3,<0.5:' setup.py
}

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1 
}
