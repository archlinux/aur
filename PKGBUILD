# Maintainer: zhs <zhao4she4@tuta.io>

pkgname=pywb-git
_pkgname=pywb
pkgver=r2191.34200724
pkgrel=1
pkgdesc="Webrecorder pywb is a Python web archiving toolkit for replaying web archives (WARC format)"
arch=("any")
url="https://github.com/webrecorder/pywb"
license=("GPL3")
depends=('python'
	 'python-brotli'
	 'python-dateutil'
	 'python-fakeredis'
	 'python-gevent'
	 'python-jinja'
	 'python-portalocker'
	 'python-py3amf'
	 'python-redis'
	 'python-requests'
	 'python-six'
	 'python-surt'
	 'python-tldextract'
	 'python-warcio'
	 'python-webassets'
	 'python-webencodings'
	 'python-werkzeug'
	 'python-wsgiprox-git'
	 'python-yaml')
makedepends=('git' 'python-setuptools')
source=("git+https://github.com/webrecorder/pywb")
sha256sums=('SKIP')

pkgver() {
        cd "${srcdir}/${_pkgname}"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_pkgname}"
	python setup.py build
}

package() {
    cd "${srcdir}/${_pkgname}"
    python setup.py install --root="${pkgdir}" --skip-build --optimize=1
    rm -rf "${pkgdir}/usr/sample_archive"
    rm -rf ${pkgdir}/usr/lib/*/site-packages/tests
}
