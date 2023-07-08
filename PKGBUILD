# Maintainer: Castor <whoisyoges at castorisdead dot xyz>
pkgname=onthespot-git
pkgver=0.5
_branch="main"
pkgrel=1
pkgdesc="Qt based music downloader written in python."
arch=('any')
url="https://github.com/casualsnek/onthespot"
license=('GPLv2')
depends=('ffmpeg' 'python-requests' 'python-pyqt5' 'python-pillow' 'python-show-in-file-manager' 'python-certifi' 'python-pyxdg' 'python-librespot' 'python-music-tag' 'python-mutagen')
conflicts=('onthespot')
provides=('onthespot')
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
optdepends=()
source=("$url/archive/refs/heads/$_branch.zip")
sha256sums=(SKIP)

build() {
  cd "onthespot-$_branch"
  python -m build --wheel --no-isolation
}

pkgver() {
  grep "self.version = *" "$PWD/onthespot-$_branch/src/onthespot/otsconfig.py" | sed 's/self.version = //g;s/ //g'
}

package() {
  cd "onthespot-$_branch"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -dm 755 "$pkgdir/usr/share/applications"
  install -dm 755 "$pkgdir/usr/share/icons/hicolor/"{256x256,scalable}"/apps/"
  install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
  install -Dm 644 "src/onthespot/resources/org.eu.casualsnek.onthespot.desktop" "$pkgdir/usr/share/applications/"
  install -Dm 644 "src/onthespot/resources/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/casual_onthespot.svg"
  install -Dm 644 "src/onthespot/resources/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/casual_onthespot.png"
}
