# Maintainer: Jose Lopes <josemslopes at gmail dot com>

_name=blink
_pkgname=blink-qt
pkgname=blink-git
pkgver=5.9.1.r1873.c46c60d
pkgrel=1
pkgdesc='Fully featured, easy to use SIP client with a Qt based UI'
arch=('aarch64' 'x86_64')
url='https://icanblink.com'
license=('GPL-3+')
makedepends=(
  'cython0'
  'git'
  'python-build'
  'python-installer'
  'python-wheel'
  )
depends=(
  'icu'
  'libvncserver'
  'python-application'
  'python-eventlib'
  'python-gevent'
  'python-gmpy2'
  'python-google-api-python-client'
  'python-lxml'
  'python-lxml-html-clean'
  'python-oauth2client'
  'python-pgpy'
  'python-pyopenssl'
  'python-pyqt5'
  'python-pyqt5-webengine'
  'python-requests'
  'python-service-identity'
  'python-sipsimple'
  'python-sqlobject'
  'python-twisted'
  'python-zope-interface'
  'qt5-svg'
  'qt5-webchannel'
  'qt5-webengine'
  )
conflicts=('blink')
provides=('blink')
optdepends=('x11vnc: for screen sharing')
source=("${pkgname}::git+https://github.com/AGProjects/${_pkgname}.git")
noextract=()
sha512sums=(
  'SKIP'
)

pkgver() {
    cd "${pkgname}"
    base_version=$(grep __version__  blink/__info__.py | sed 's|.*"\(.*\)".*|\1|')
    printf "%s.r%s.%s" "${base_version}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname}"
  python -m build --wheel --no-isolation
}

package() {
  cd "${pkgname}"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # license
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${_name}/LICENSE"

  # desktop file
  install -Dm644 "debian/${_name}.desktop" "${pkgdir}/usr/share/applications/${_name}.desktop"
}
