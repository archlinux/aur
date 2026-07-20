# Maintainer: massiveadam <51133980+massiveadam at users dot noreply dot github dot com>
pkgname=roon-proton
pkgver=0.2.0
pkgrel=6
pkgdesc='Roon desktop controller and native audio endpoint for Arch Linux'
arch=('x86_64')
url='https://github.com/massiveadam/roon-wine'
license=('MIT')
depends=(
  'alsa-lib'
  'bash'
  'curl'
  'libpulse'
  'p7zip'
  'psmisc'
  'python'
  'umu-launcher>=1.4.0'
  'xorg-xwayland'
)
provides=("roon-wine=$pkgver")
conflicts=('roon-wine')
install='roon-proton.install'
optdepends=(
  'pipewire-audio: desktop-following System Output endpoint'
  'pipewire-pulse: Pulse compatibility for the System Output endpoint'
  'wireplumber: default-device routing for the System Output endpoint'
  'wine: system Wine fallback runner'
  'winetricks: runtime setup for the system Wine fallback'
)
source=(
  'roon-wine'
  'roon-wine.desktop'
  'roon-umu-run'
  'roon-proton.niri.kdl'
  'roon-proton.hyprland.conf'
  'roon-proton.hyprland.lua'
  'roon-system-output.service'
  '90-roon-loopback.conf'
  'roon-proton.modules-load.conf'
  'roon-proton.modprobe.conf'
  'LICENSE'
)
sha256sums=('0e9d19c79b5dd278495b76541c19af6bfc598381bb4466cfaa15ccb2c2a715fc'
            '063eb4ed5c43dc3c3ad7f392dbcd688cf5a0faca345a0074271eb78b93375df3'
            'cdf20b663f91c5d9b44d314dfb805ac5e9bc1bb7fa9c4b2cc542a255655e3348'
            'aab5a24dff98029cbb17a40c27af62b14a114c58d1e398b02a02b4404b8af528'
            'fa0808ac99a1ecb1180c672cd634fd561e4c377029ca7cff0920bddc71e42778'
            'ffb8bd1b1c39ba5274f20b2ef564c50b68ae2c41ea501d96d2f407f9d89ea085'
            'ca37ba9213636cc88b3ce1191da260ac7d967111fac7239f35b1b3ee124fd140'
            'e2b4e5a39ecf2710dd83f990146dfe2829a5f0ff4c9468b811841d71f7261e25'
            '3cf1ee727de177bc89e58f65e2e9d8292e1899db1e08a7787d7aff2a2f3c066c'
            'f989b9b5d0c0f81f6e2256d597e312b89bd053a1e0c18087fc7e93852f2b2964'
            'bcecb636801e3d141e250e5d457229661aaf57138f03899c172ce2446dcd22ad')

package() {
  install -Dm755 "$srcdir/roon-wine" "$pkgdir/usr/bin/roon-proton"
  ln -s roon-proton "$pkgdir/usr/bin/roon-wine"
  install -Dm755 "$srcdir/roon-umu-run" \
    "$pkgdir/usr/lib/roon-proton/roon-umu-run"
  install -Dm644 "$srcdir/roon-wine.desktop" \
    "$pkgdir/usr/share/applications/roon-proton.desktop"
  sed -i 's/^Exec=roon-wine/Exec=roon-proton/' \
    "$pkgdir/usr/share/applications/roon-proton.desktop"
  install -Dm644 "$srcdir/roon-proton.niri.kdl" \
    "$pkgdir/usr/share/roon-proton/wm/roon-proton.niri.kdl"
  install -Dm644 "$srcdir/roon-proton.hyprland.conf" \
    "$pkgdir/usr/share/roon-proton/wm/roon-proton.hyprland.conf"
  install -Dm644 "$srcdir/roon-proton.hyprland.lua" \
    "$pkgdir/usr/share/roon-proton/wm/roon-proton.hyprland.lua"
  install -Dm644 "$srcdir/roon-system-output.service" \
    "$pkgdir/usr/lib/systemd/user/roon-system-output.service"
  install -Dm644 "$srcdir/90-roon-loopback.conf" \
    "$pkgdir/usr/share/pipewire/pipewire.conf.d/90-roon-loopback.conf"
  install -Dm644 "$srcdir/roon-proton.modules-load.conf" \
    "$pkgdir/usr/lib/modules-load.d/roon-proton.conf"
  install -Dm644 "$srcdir/roon-proton.modprobe.conf" \
    "$pkgdir/usr/lib/modprobe.d/roon-proton.conf"
  install -Dm644 "$srcdir/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
