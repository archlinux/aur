# Maintainer: Tom Jakubowski <tom@crystae.net>

pkgname=obi
pkgver=3.4.2
pkgrel=2
pkgdesc="A command-line tool for developing g-speaky applications"
arch=('any')
url="https://github.com/Oblong/obi"
license=('MIT')
depends=('python2' 'python2-docopt' 'python2-jinja' 'python2-setuptools' 'python2-yaml')
source=("https://github.com/Oblong/obi/archive/v${pkgver}.tar.gz")
sha256sums=('fd5e41cb25204a44b61d6054ced2465d5db6b4d5e3078b56e03823e1d6ac9e81')

prepare() {
    cd "${pkgname}-${pkgver}"
    # work around overly tight install_requires
    sed -i 's/fabric==1\.10\.3/fabric>=1.10.3,<2/' setup.py
    sed -i 's/jinja2==2\.8/jinja2>=2.8,<3/' setup.py
    sed -i 's/pyyaml==3\.11/pyyaml>=3.11,<4/' setup.py
}

package() {
    cd "${pkgname}-${pkgver}"
    python2 setup.py install --root="${pkgdir}/"
    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
