# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=protonup-qt
_app_id=net.davidotek.pupgui2
pkgver=2.15.1
pkgrel=1
pkgdesc="Install and manage GE-Proton, Luxtorpeda & more for Steam, Lutris and Heroic"
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
sha256sums=('7028c0f3451fcb69f384ba0687b58a973b35fab2b0a64d5435eb1f782f09ea08')

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

  cp -a share "$pkgdir/usr/"

  ln -s "/usr/bin/$pkgname" "$pkgdir/usr/bin/${_app_id}"
}
