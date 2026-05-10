# Maintainer: liixini <https://github.com/liixini>
pkgname=skwd
pkgver=r1.0000000
pkgrel=1
pkgdesc='Skwd '
arch=('any')
url='https://github.com/liixini/skwd'
license=('MIT')
depends=(
  'skwd-daemon'
  'quickshell'
  'qt6-multimedia'
  'qt6-declarative'
  'qt6-imageformats'
  'matugen'
  'curl'
  'file'
  'inotify-tools'
  'iwd'
  'ttf-nerd-fonts-symbols'
  'ttf-roboto'
)

install="${pkgname}.install"
source=("${pkgname}::git+https://github.com/liixini/skwd.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  local _sharedir="$pkgdir/usr/share/skwd"

  # skwd-bar
  install -dm755 "$_sharedir/skwd-bar"
  cp -a skwd-bar/shell.qml "$_sharedir/skwd-bar/shell.qml"
  cp -a skwd-bar/qml       "$_sharedir/skwd-bar/qml"
  cp -a skwd-bar/data      "$_sharedir/skwd-bar/data"
  cp -a skwd-bar/ext       "$_sharedir/skwd-bar/ext"
  install -Dm755 packaging/wrappers/skwd-bar "$pkgdir/usr/bin/skwd-bar"

  # skwd-launch
  install -dm755 "$_sharedir/skwd-launch"
  cp -a skwd-launch/shell.qml "$_sharedir/skwd-launch/shell.qml"
  cp -a skwd-launch/qml       "$_sharedir/skwd-launch/qml"
  cp -a skwd-launch/data      "$_sharedir/skwd-launch/data"
  install -Dm755 packaging/wrappers/skwd-launch "$pkgdir/usr/bin/skwd-launch"

  # skwd-music
  install -dm755 "$_sharedir/skwd-music"
  cp -a skwd-music/shell.qml "$_sharedir/skwd-music/shell.qml"
  cp -a skwd-music/qml       "$_sharedir/skwd-music/qml"
  cp -a skwd-music/data      "$_sharedir/skwd-music/data"
  install -Dm755 packaging/wrappers/skwd-music "$pkgdir/usr/bin/skwd-music"

  # skwd-notification
  install -dm755 "$_sharedir/skwd-notification"
  cp -a skwd-notification/shell.qml "$_sharedir/skwd-notification/shell.qml"
  cp -a skwd-notification/qml       "$_sharedir/skwd-notification/qml"
  install -Dm755 packaging/wrappers/skwd-notification "$pkgdir/usr/bin/skwd-notification"

  # skwd-settings
  install -dm755 "$_sharedir/skwd-settings"
  cp -a skwd-settings/shell.qml "$_sharedir/skwd-settings/shell.qml"
  cp -a skwd-settings/qml       "$_sharedir/skwd-settings/qml"
  install -Dm755 packaging/wrappers/skwd-settings "$pkgdir/usr/bin/skwd-settings"

  # skwd-switch
  install -dm755 "$_sharedir/skwd-switch"
  cp -a skwd-switch/shell.qml "$_sharedir/skwd-switch/shell.qml"
  cp -a skwd-switch/qml       "$_sharedir/skwd-switch/qml"
  cp -a skwd-switch/data      "$_sharedir/skwd-switch/data"
  install -Dm755 packaging/wrappers/skwd-switch "$pkgdir/usr/bin/skwd-switch"

  install -Dm644 data/config.json.example "$_sharedir/data/config.json.example"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
