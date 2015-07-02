# Maintainer: Erhan SAHIN < erhan@ssahin.net >

pkgname=("python2-cinderclient-liberty")
pkgver="1.2.2"
pkgrel="1"
pkgdesc="Python client library for Cinder"
arch=("any")
url="https://github.com/openstack/python-cinderclient"
license=("Apache")
makedepends=("python2-setuptools")
source=("https://pypi.python.org/packages/source/p/python-cinderclient/python-cinderclient-${pkgver}.tar.gz")
sha256sums=('78707be107a29a4218874c1092e99275417630d1d3120689f628862adc3b326a')

prepare() {
    cd "${srcdir}/python-cinderclient-${pkgver}"
    sed -ri '/argparse|pbr/d' requirements.txt
}

package() {
    depends=("python2-pbr>=0.11"
             "python2-argparse"
             "python2-prettytable>=0.7"
	     "python2-keystoneclient-liberty"
	     "python2-requests>=2.5.2"
	     "python2-simplejson>=2.2.0"
	     "python2-babel>=1.3"
             "python2-six>=1.9.0")
    cd "${srcdir}/python-cinderclient-${pkgver}"
    python2 setup.py install --root="${pkgdir}" --optimize=1
    install -Dm644 "tools/cinder.bash_completion" "${pkgdir}/usr/share/bash-completion/completions/cinder"
}
