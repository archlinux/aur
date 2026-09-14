# Maintainer: Julian Y. Richard Corbet (julian-corbet on GitHub)
# Prebuilt with RUSTFLAGS="-C target-cpu=x86-64-v3" -- targets x86-64-v3 microarchitecture
# (Haswell/Excavator and newer). Links the SYSTEM libpam (required for the unlock path),
# so this package is Arch-native rather than a static/musl build.
pkgname=clck-bin
pkgver=0.1.0
pkgrel=1
pkgdesc="Wayland session locker with live kiosk outputs (prebuilt, x86-64-v3)"
arch=('x86_64')
url="https://github.com/corbet-labs/clck"
license=('LicenseRef-FSL-1.1-ALv2')
depends=('pam' 'wayland' 'libxkbcommon')
provides=('clck' 'nixlock')
conflicts=('clck' 'nixlock' 'nixlock-bin')
source=("https://github.com/corbet-labs/clck/releases/download/v${pkgver}/clck-${pkgver}-x86_64-v3.tar.gz")
sha256sums=('b3fdefca7653779de1afd93d87256b54799193187a9c853846d2786781ad1d50')

package() {
    install -Dm755 clck "$pkgdir/usr/bin/clck"
    # Compat: the fleet's idle/lock wiring invokes the bare name `nixlock` until the
    # binary-rename deploy step lands. Removable once lockCommand moves to `clck`.
    ln -s clck "$pkgdir/usr/bin/nixlock"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
