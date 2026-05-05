pkgname=waft-git
pkgver=r0.0000000
pkgrel=1
pkgdesc="Waft central daemon with all plugins for entity routing and lifecycle management"
arch=('x86_64' 'aarch64')
url="https://github.com/readyplayernan/waft"
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git' 'rust')
provides=('waft'
  'waft-plugin-audio'
  'waft-plugin-awww'
  'waft-plugin-battery'
  'waft-plugin-bluez'
  'waft-plugin-brightness'
  'waft-plugin-caffeine'
  'waft-plugin-claude'
  'waft-plugin-clock'
  'waft-plugin-darkman'
  'waft-plugin-eds'
  'waft-plugin-gnome-online-accounts'
  'waft-plugin-gsettings'
  'waft-plugin-internal-apps'
  'waft-plugin-keyboard-layout'
  'waft-plugin-networkmanager'
  'waft-plugin-niri'
  'waft-plugin-notifications'
  'waft-plugin-sunsetr'
  'waft-plugin-syncthing'
  'waft-plugin-systemd'
  'waft-plugin-weather'
  'waft-plugin-xdg-apps')
conflicts=('waft'
  'waft-plugin-audio-git'
  'waft-plugin-awww-git'
  'waft-plugin-battery-git'
  'waft-plugin-bluez-git'
  'waft-plugin-brightness-git'
  'waft-plugin-caffeine-git'
  'waft-plugin-claude-git'
  'waft-plugin-clock-git'
  'waft-plugin-darkman-git'
  'waft-plugin-eds-git'
  'waft-plugin-gnome-online-accounts-git'
  'waft-plugin-gsettings-git'
  'waft-plugin-internal-apps-git'
  'waft-plugin-keyboard-layout-git'
  'waft-plugin-networkmanager-git'
  'waft-plugin-niri-git'
  'waft-plugin-notifications-git'
  'waft-plugin-sunsetr-git'
  'waft-plugin-syncthing-git'
  'waft-plugin-systemd-git'
  'waft-plugin-weather-git'
  'waft-plugin-xdg-apps-git')
source=("$pkgname::git+https://github.com/readyplayernan/waft.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo build --frozen --release \
    --bin waft \
    --bin waft-audio-daemon \
    --bin waft-awww-daemon \
    --bin waft-battery-daemon \
    --bin waft-bluez-daemon \
    --bin waft-brightness-daemon \
    --bin waft-caffeine-daemon \
    --bin waft-claude-daemon \
    --bin waft-clock-daemon \
    --bin waft-darkman-daemon \
    --bin waft-eds-daemon \
    --bin waft-gnome-online-accounts-daemon \
    --bin waft-gsettings-daemon \
    --bin waft-internal-apps-daemon \
    --bin waft-keyboard-layout-daemon \
    --bin waft-networkmanager-daemon \
    --bin waft-niri-daemon \
    --bin waft-notifications-daemon \
    --bin waft-sunsetr-daemon \
    --bin waft-syncthing-daemon \
    --bin waft-systemd-daemon \
    --bin waft-weather-daemon \
    --bin waft-xdg-apps-daemon
}

check() {
  cd "$srcdir/$pkgname"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  cargo test --frozen -p waft -p waft-protocol -p waft-plugin
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/waft" "$pkgdir/usr/bin/waft"
  install -Dm755 "target/release/waft-audio-daemon" "$pkgdir/usr/bin/waft-audio-daemon"
  install -Dm755 "target/release/waft-awww-daemon" "$pkgdir/usr/bin/waft-awww-daemon"
  install -Dm755 "target/release/waft-battery-daemon" "$pkgdir/usr/bin/waft-battery-daemon"
  install -Dm755 "target/release/waft-bluez-daemon" "$pkgdir/usr/bin/waft-bluez-daemon"
  install -Dm755 "target/release/waft-brightness-daemon" "$pkgdir/usr/bin/waft-brightness-daemon"
  install -Dm755 "target/release/waft-caffeine-daemon" "$pkgdir/usr/bin/waft-caffeine-daemon"
  install -Dm755 "target/release/waft-claude-daemon" "$pkgdir/usr/bin/waft-claude-daemon"
  install -Dm755 "target/release/waft-clock-daemon" "$pkgdir/usr/bin/waft-clock-daemon"
  install -Dm755 "target/release/waft-darkman-daemon" "$pkgdir/usr/bin/waft-darkman-daemon"
  install -Dm755 "target/release/waft-eds-daemon" "$pkgdir/usr/bin/waft-eds-daemon"
  install -Dm755 "target/release/waft-gnome-online-accounts-daemon" "$pkgdir/usr/bin/waft-gnome-online-accounts-daemon"
  install -Dm755 "target/release/waft-gsettings-daemon" "$pkgdir/usr/bin/waft-gsettings-daemon"
  install -Dm755 "target/release/waft-internal-apps-daemon" "$pkgdir/usr/bin/waft-internal-apps-daemon"
  install -Dm755 "target/release/waft-keyboard-layout-daemon" "$pkgdir/usr/bin/waft-keyboard-layout-daemon"
  install -Dm755 "target/release/waft-networkmanager-daemon" "$pkgdir/usr/bin/waft-networkmanager-daemon"
  install -Dm755 "target/release/waft-niri-daemon" "$pkgdir/usr/bin/waft-niri-daemon"
  install -Dm755 "target/release/waft-notifications-daemon" "$pkgdir/usr/bin/waft-notifications-daemon"
  install -Dm755 "target/release/waft-sunsetr-daemon" "$pkgdir/usr/bin/waft-sunsetr-daemon"
  install -Dm755 "target/release/waft-syncthing-daemon" "$pkgdir/usr/bin/waft-syncthing-daemon"
  install -Dm755 "target/release/waft-systemd-daemon" "$pkgdir/usr/bin/waft-systemd-daemon"
  install -Dm755 "target/release/waft-weather-daemon" "$pkgdir/usr/bin/waft-weather-daemon"
  install -Dm755 "target/release/waft-xdg-apps-daemon" "$pkgdir/usr/bin/waft-xdg-apps-daemon"
  install -Dm644 "data/org.waft.Daemon.service" "$pkgdir/usr/share/dbus-1/services/org.waft.Daemon.service"
  install -Dm644 "data/waft.service" "$pkgdir/usr/lib/systemd/user/waft.service"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
