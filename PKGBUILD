# Maintainer:	Batuhan Baserdem <lastname dot firstname at gmail>
# Maintainer:	Kostas Kardaras <firstname dot lastname at gmail>

pkgname='maestral'
provides=('maestral')
conflicts=('maestral-git')
pkgver=1.2.1
pkgrel=1
pkgdesc='A light-weight and open-source CLI Dropbox client.'
arch=('x86_64')
url="https://github.com/SamSchott/${pkgname}"
license=('MIT')
source=("${url}/archive/v${pkgver}.tar.gz" "maestral@.service")
makedepends=('python-setuptools')
changelog=CHANGELOG.md
depends=(
    'python>=3.8'
    'python-alembic>=1.3.0'
    'python-bugsnag>=3.4.0'
    'python-click>=7.1.1'
    'python-dropbox>=10.4.1'
    'python-fasteners>=0.15'
    'python-dbus-next>=0.1.4'
    'python-keyring>=19.0.0'
    'python-keyrings-alt>=3.1.0'
    'python-packaging'
    'python-pathspec>=0.5.8'
    'python-pyro5>=5.10'
    'python-requests>=2.16.2'
    'python-sdnotify>=0.3.2'
    'python-sqlalchemy>=1.3'
    'python-watchdog>=0.10.0'
    'python-systemd')
md5sums=('a306fbbc2407110e4f494f875b510020'
         '25d1041b158c1b1ea42d7290c9c0f91d')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python setup.py build
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    # Run python setup function
    python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
    # Install the licence
    install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" \
    	"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    # Install the systemd unit provided
    install -Dm644 "${srcdir}/maestral@.service" \
        "${pkgdir}/usr/lib/systemd/user/maestral@.service"
}
