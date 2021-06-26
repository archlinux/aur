# Maintainer: Daniel Langbein <daniel@systemli.org>

pkgname="riseup-vpn-terminal"
pkgver=0.0.5
pkgrel=1
pkgdesc="Script and desktop entry to start RiseupVPN in a terminal; useful when desktop environment does not support tray icons (e.g. GNOME, Phoc)"
arch=('any')
license=('MIT')
depends=('riseup-vpn')

# This is required for e.g. the PinePhone where otherwise
# no polkit agent is running. See this issue:
# https://0xacab.org/leap/bitmask-vpn/-/issues/374
optdepends+=('lxqt-policykit: Provides a policykit agent. Usually one is started by the desktop environment, but on the PinePhone with Phosh this is currently missing.')

source=('riseup-vpn-terminal' \
        'riseup-vpn-terminal.desktop')
sha256sums=('b5aaee2201383fbb42d1c020319239219f493f613ce4120101df657b9e4cf500' \
            '8f77468d7852b489a6b1ff4c88272e3aee50af49d7e36341bf1677e872e5aecb')

package() {
  install -Dm0555 riseup-vpn-terminal         "$pkgdir"/usr/bin/riseup-vpn-terminal
  install -Dm0644 riseup-vpn-terminal.desktop "$pkgdir"/usr/share/applications/riseup-vpn-terminal.desktop

  # Uncomment the line below when KGX is the only installed terminal (e.g. on PinePhone with Phosh)
  # See also: https://github.com/dreemurrs-embedded/Pine64-Arch/issues/182
  #ln -sf /usr/bin/kgx "$pkgdir"/usr/bin/dtterm
}
