# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>
# Maintainer:	Kostas Kardaras <firstname dot lastname at gmail>

_srcname='maestral-dropbox'

pkgname='maestral'
provides=('maestral')
conflicts=('maestral-git')
pkgver=1.0.0.dev4
pkgrel=2
pkgdesc='A light-weight and open-source CLI Dropbox client.'
arch=('x86_64')
url="https://github.com/SamSchott/${_srcname}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz")
makedepends=('python-setuptools')
depends=(
    'python>=3.8'
    'python-atomicwrites'
    'python-blinker'
    'python-bugsnag'
    'python-click>=7.0'
    'python-dropbox>=10.0'
    'python-jeepney'
    'python-keyring>=19.0.0'
    'python-keyrings-alt>=3.0.0'
    'python-lockfile'
    'python-pathspec'
    'python-pyro5'
    'python-requests'
    'python-sdnotify'
    'python-watchdog>=0.10.0'
    'python-systemd')
md5sums=('31c8ca3a4de13d718e59dbbe57268d1a')

build() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${_srcname}-${pkgver}"
    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Install the licence
    install -Dm644 "${srcdir}/${_srcname}-${pkgver}/LICENSE.txt" \
    	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
