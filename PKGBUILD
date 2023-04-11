# Maintainer: Froggo <Froggo8311@proton.me>

pkgname=groupme-git
pkgver=latest
pkgrel=1
pkgdesc='Unofficial GroupMe electron client (git version)'

arch=(any)
url="https://github.com/dcrousso/GroupMe"
license=('MIT')

depends=('electron' 'tar' 'npm' 'git')
options=('!docs' '!emptydirs')
source=("groupme.desktop")
md5sums=('82e829e0ad8ed756453569edc6cddeb9')
provides=(groupme)
conflicts=(groupme)

package() {
  # Open GroupMe tarball, install deps, & compile
  git clone $url GroupMe-$pkgver
  cd GroupMe-$pkgver
  npm install
  npm install electron-packager
  npm run build-linux
  cd ..

  # Move built program to output directory
  mkdir $pkgdir/opt/
  mv GroupMe-$pkgver/dist/GroupMe-linux-x64 $pkgdir/opt/groupme
  rm -rf GroupMe-$pkgver

  # Install .desktop
  mkdir -p $pkgdir/usr/share/applications/
  cp groupme.desktop $pkgdir/usr/share/applications/
}
