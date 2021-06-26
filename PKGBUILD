# Maintainer: Daniel Langbein <daniel@systemli.org>

pkgname="riseup-vpn-terminal"
pkgver=0.0.4
pkgrel=1
pkgdesc="Script and desktop entry to start RiseupVPN in a terminal; useful when desktop environment does not support tray icons (e.g. GNOME, Phoc)"
arch=('any')
license=('MIT')
depends=('riseup-vpn')
depends+=('curl')  # see riseup-vpn-terminal script

# This is required for e.g. the PinePhone where otherwise
# no polkit agent is running. See this issue:
# https://0xacab.org/leap/bitmask-vpn/-/issues/374
optdepends+=('lxqt-policykit: Provides a policykit agent. Usually one is started by the desktop environment, but on the PinePhone with Phosh this is currently missing.')

source=('riseup-vpn-terminal' \
        'riseup-vpn-terminal.desktop')
sha256sums=('a3c81910c00fc91c77538b5f2a48b92ac3aba3915b88e67880ecbcdae8daaec0' \
            '8f77468d7852b489a6b1ff4c88272e3aee50af49d7e36341bf1677e872e5aecb')

package() {
  install -Dm0555 riseup-vpn-terminal         "$pkgdir"/usr/bin/riseup-vpn-terminal
  install -Dm0644 riseup-vpn-terminal.desktop "$pkgdir"/usr/share/applications/riseup-vpn-terminal.desktop

  # Uncomment the line below when using KGX as terminal (this is the case when using Phosh)
  # See also: https://github.com/dreemurrs-embedded/Pine64-Arch/issues/182
  #ln -sf /usr/bin/kgx "$pkgdir"/usr/bin/konsole
}
