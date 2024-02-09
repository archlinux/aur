# Maintainer:  Anton Kudelin <kudelin at proton dot me>
# Contributor: b00rt00s <b00rt00s.aur@gmail.com>

pkgname=vesta
pkgver=3.5.8
pkgrel=2
pkgdesc="Visualization for Electronic and STructural Analysis"
url="https://jp-minerals.org/vesta"
license=(LicenseRef-vesta-license)
arch=(x86_64)
depends=(gtk3 gtk2 glu java-environment)
makedepends=(desktop-file-utils libxtst)
source=($url/archives/$pkgver/VESTA-gtk3.tar.bz2 VESTA.desktop vesta.install)
sha256sums=('78bef025c2b31f1d64c9c7e06ad2b139d252b3a686893ee79ac74b3021868df8'
            '4eae00cd081d7b628858a03593a265c6f7698461bd265b873198d5c347c151e4'
            '35d44e99185caa17fbf69938bcccc252fde70fb7bc2d407ef376ba512db08b43')
install="vesta.install"

package() {
  cd "$pkgdir"

  install -dm755 opt
  cp -a "$srcdir/VESTA-gtk3" opt/VESTA
  chmod -R 755 opt/VESTA

  # installing the desktop file
  install -Dm644 "$srcdir/VESTA.desktop" usr/share/applications/VESTA.desktop

  # installing the license
  install -Dm644 "$srcdir/VESTA-gtk3/LICENSE" \
    usr/share/licenses/$pkgname/LICENSE

  # creating a link for the executable
  install -dm755 usr/bin
  ln -sf /opt/VESTA/VESTA usr/bin/VESTA
}
