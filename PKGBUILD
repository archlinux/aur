# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-qt
_app_id=net.davidotek.pupgui2
pkgver=2.15.0
pkgrel=1
pkgdesc="Install and manage Proton-GE and Luxtorpeda for Steam and Wine-GE for Lutris"
arch=('any')
url="https://davidotek.github.io/protonup-qt"
license=('GPL-3.0-or-later')
depends=(
  'pyside6'
  'python-inputs'
  'python-psutil'
  'python-pyaml'
  'python-pyxdg'
  'python-requests'
  'python-steam'
  'python-vdf'
  'python-zstandard'
  'qt6-tools'
  'which'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-setuptools'
  'python-wheel'
)
checkdepends=(
  'appstream'
  'desktop-file-utils'
)
optdepends=(
  'dosbox: required for Boxtron'
  'git: required for SteamTinkerLaunch'
  'inotify-tools: required for Boxtron & Roberta'
  'scummvm: required for Roberta'
  'timidity++: required for Boxtron'
  'unzip: required for SteamTinkerLaunch'
  'wget: required for SteamTinkerLaunch'
  'xdotool: required for SteamTinkerLaunch'
  'xorg-xprop: required for SteamTinkerLaunch'
  'xorg-xrandr: required for SteamTinkerLaunch'
  'xorg-xwininfo: required for SteamTinkerLaunch'
  'xxd: required for SteamTinkerLaunch'
  'yad: required for SteamTinkerLaunch'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/DavidoTek/ProtonUp-Qt/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d06fae6748c811ac942e3cd2a1d3de3efbf330b442323580ebe9b581f39546da')

build() {
  cd "ProtonUp-Qt-$pkgver"
  python -m build --wheel --no-isolation
}

check() {
  cd "ProtonUp-Qt-$pkgver"
  appstreamcli validate --no-net "share/metainfo/${_app_id}.appdata.xml"
  desktop-file-validate "share/applications/${_app_id}.desktop"
}

package() {
  cd "ProtonUp-Qt-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl

  cp -r share "$pkgdir/usr/"

  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/${_app_id}"
}
