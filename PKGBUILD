# Maintainer: Tom Jakubowski <tom@crystae.net>

pkgname=obi
pkgver=3.4.2
pkgrel=1
pkgdesc="A command-line tool for developing g-speaky applications"
arch=('any')
url="https://github.com/Oblong/obi"
license=('MIT')
depends=('python2' 'python2-docopt' 'python2-jinja' 'python2-setuptools' 'python2-yaml')
source=(https://github.com/Oblong/obi/archive/v${pkgver}.tar.gz)
md5sums=('cd8a680744bb8d573c0c76aa5cffdb0b')

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
