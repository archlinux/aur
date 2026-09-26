# Maintainer: Judd <ipajudd at gmail dot com>
#
# Repackages the .deb from the GitHub release. .github/workflows/aur.yml sets
# pkgver, pkgrel and the checksums, then pushes this file to the AUR.

pkgname=pob-redux-bin
_pkgname=pob-redux
pkgver=0.4.7
pkgrel=1
pkgdesc="Path of Building for Path of Exile 1 and 2, rebuilt"
arch=('x86_64')
url="https://pobredux.com"
license=('MIT')
depends=('webkit2gtk-4.1' 'gtk3' 'libsoup3' 'glib2' 'cairo' 'gdk-pixbuf2' 'dbus' 'gcc-libs' 'glibc' 'hicolor-icon-theme')
optdepends=('gnome-keyring: store assistant API keys'
            'kwallet: store assistant API keys')
provides=("$_pkgname")
conflicts=("$_pkgname")
options=('!strip' '!debug')
source=("$_pkgname-$pkgver.deb::https://github.com/pobredux/pob-redux/releases/download/v$pkgver/PoB.Redux_${pkgver}_amd64.deb"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/pobredux/pob-redux/v$pkgver/LICENSE")
sha256sums=('b832ad8f8d842d03671e138fa56c58b65eea9fb02eeca910218441f54d43321b'
            '1724147fdca0d7d5be9f05217865af65e595ff3d17c8bcbd58683fe23e8909f7')

package() {
  bsdtar -xf data.tar.* -C "$pkgdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
