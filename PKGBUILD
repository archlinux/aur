# Maintainer: ngld <ngld@tproxy.de>
_name=knossos
pkgname=fs2-knossos
pkgver=0.14.3
pkgrel=3
pkgdesc="A simple mod manager for FreeSpace 2 Open"
arch=('any')
url="https://github.com/ngld/knossos"
license=('Apache')
groups=()
depends=(
  'python' 'python-pip' 'python-six' 'python-requests' 'python-requests-toolbelt' 'python-ply' 'python-token-bucket' 'python-pyqt5' 'qt5-webengine' 'python-pyqtwebengine'
  'qt5-webchannel' 'qt5-tools' 'python-semantic-version' 'python-raven' 'p7zip' 'openal' 'sdl2'
)
makedepends=('python-setuptools' 'ninja' 'yarn')
options=(!emptydirs)
source=(
    "https://github.com/ngld/old-knossos/archive/v${pkgver}.tar.gz"
    knossos
    knossos.desktop)

md5sums=('9ad4ab7ba23dc59bb032795130c50eb7'
         '541dfc75f3aecbe08b843eeec252e4b4'
         '2974a45a1f75051607d6d1402a8c429b')

package() {
    cd "$srcdir/old-${_name}-$pkgver"

    yarn install
    python configure.py
    ninja resources
    python setup.py install --root="$pkgdir/" --optimize=1

    install -Dm755 ../knossos "$pkgdir/usr/bin/knossos"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 NOTICE "$pkgdir/usr/share/licenses/$pkgname/NOTICE"
    install -Dm644 ../knossos.desktop "$pkgdir/usr/share/applications/knossos.desktop"
    install -Dm644 knossos/data/hlp.png "$pkgdir/usr/share/pixmaps/hlp.png"
}

# vim:set ts=2 sw=2 et:
