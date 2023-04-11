pkgname=groupme
pkgver=1.1.2
pkgrel=1
pkgdesc="Unofficial GroupMe App"

arch=('x86_64')
url="https://github.com/dcrousso/GroupMe"
license=('MIT')

depends=('electron' 'tar' 'npm')
options=('!docs' '!emptydirs')
source=("https://github.com/dcrousso/GroupMe/archive/refs/tags/v${pkgver}.tar.gz" "groupme.desktop")
md5sums=('43e1f2e43d646008bb54778981fd5bca' '82e829e0ad8ed756453569edc6cddeb9')


package() {
  tar -xf v$pkgver.tar.gz
  cd GroupMe-$pkgver
  npm install
  npm install electron-packager
  npm run build-linux
  cd ..

  mkdir $pkgdir/opt/
  mv GroupMe-$pkgver/dist/GroupMe-linux-x64 $pkgdir/opt/groupme
  rm -rf GroupMe-$pkgver

  # Link to the binary
  mkdir -p $pkgdir/usr/share/applications/
  cp groupme.desktop $pkgdir/usr/share/applications/
  ln -sf /usr/bin/groupme /opt/groupme/GroupMe
}
