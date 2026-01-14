# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: b00rt00s <b00rt00s.aur@gmail.com>

pkgname=vesta
pkgver=3.90.5a
pkgrel=1
pkgdesc="Visualization for Electronic and STructural Analysis"
url="https://jp-minerals.org/vesta"
license=(LicenseRef-vesta-license)
arch=(x86_64)
depends=(gtk3 glu java-environment webkit2gtk)
makedepends=(desktop-file-utils libxtst)
options=(!debug !strip)
source=($url/archives/testing/VESTA-gtk3-x86_64.tar.bz2 VESTA.desktop vesta.install)
sha256sums=('5af3be45cd19d4b601b9d3e190d39fd8cf66f013e012420839847bb4519a33a6'
            '4eae00cd081d7b628858a03593a265c6f7698461bd265b873198d5c347c151e4'
            '35d44e99185caa17fbf69938bcccc252fde70fb7bc2d407ef376ba512db08b43')
install="vesta.install"

package() {
  cd "$pkgdir"

  install -dm755 opt
  cp -a "$srcdir/VESTA-gtk3-x86_64" opt/VESTA
  chmod -R 755 opt/VESTA

  # installing the desktop file
  install -Dm644 "$srcdir/VESTA.desktop" usr/share/applications/VESTA.desktop

  # installing the license
  install -Dm644 "$srcdir/VESTA-gtk3-x86_64/LICENSE" \
    usr/share/licenses/$pkgname/LICENSE

  # creating a link for the executable
  install -dm755 usr/bin
  ln -sf /opt/VESTA/VESTA usr/bin/VESTA
}
