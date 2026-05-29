# Maintainer: Guy Chait <53366531+gchait@users.noreply.github.com>
pkgname=autocake
pkgver=0.2.1
pkgrel=1
pkgdesc="Fully automated SQM (cake) bandwidth tuner for Linux Wi-Fi workstations"
arch=('any')
url="https://github.com/gchait/autocake"
license=('MIT')
depends=('bash' 'iproute2' 'curl')
# No makedepends: base-devel is assumed installed for AUR builds, which
# already provides make, sed, install, etc. Listing them is discouraged
# per current Arch packaging guidelines.
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
# Upstream keeps SKIP; publish.sh fills the real hash into the AUR-side
# copy at submission time so this file never needs to be edited per
# release. Users install from AUR, never from this PKGBUILD directly.
sha256sums=('38e47657e2c2fc8a232df0c3ede98ee00816ded3660af331a4a75c58b7a5e6dd')
install=$pkgname.install

package() {
  cd "$pkgname-$pkgver"

  # Arch-conventional paths — see README.md § Install for rationale.
  make install \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    SYSTEMDDIR=/usr/lib/systemd/system

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
