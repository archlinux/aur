# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-cinderclient-kilo")
pkgver="1.1.1"
pkgrel="1"
pkgdesc="Python client library for Cinder"
arch=("any")
url="https://github.com/openstack/python-cinderclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-cinderclient/python-cinderclient-${pkgver}.tar.gz")
sha256sums=('107ff53c9bb9403c4e751b9a949cb84eff483d3378007415066d0c7727a6e37e')

prepare() {
    cd "${srcdir}/python-cinderclient-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
}

package() {
    depends=("python2-prettytable>=0.7"
	     "python2-keystoneclient-kilo"
	     "python2-requests>=2.2.0"
	     "python2-simplejson>=2.2.0"
	     "python2-babel>=1.3"
             "python2-six>=1.7.0")
    cd "${srcdir}/python-cinderclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/cinder.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/cinder"
}
