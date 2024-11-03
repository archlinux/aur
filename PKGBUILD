#Maintainer: Maxb0tbeep <max@polygonal.place)
pkgname=deskthing-git
pkgrel=1
pkgver=r246.fdeee67
pkgdesc="This is the DeskThing project. Using Spotify's existing Car Thing, the DeskThing makes the perfect desk assistant."
arch=(x86_64)
url="https://github.com/ItsRiprod/DeskThing"
license=('MIT')
makedepends=(nodejs npm typescript)
provides=(deskthing)
conflicts=(deskthing)
source=("git+https://github.com/ItsRiprod/DeskThing")
md5sums=(SKIP)

pkgver() {
  cd "$srcdir/DeskThing"
  # Generate a version based on the latest commit hash
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/DeskThing/DeskThingServer"
  npm install
  npm run build
}

package() {
  cd "$srcdir/DeskThing/DeskThingServer"
  
  install -dm755 "$pkgdir/usr/share/deskthing"
  
  cp -r "dist/linux-unpacked/"* "$pkgdir/usr/share/deskthing/"
  cp "resources/icon.png" "$pkgdir/usr/share/deskthing/"
  
  install -dm755 "$pkgdir/usr/bin"
  ln -sf "/usr/share/deskthing/deskthing" "$pkgdir/usr/bin/deskthing"

  install -dm755 "$pkgdir/usr/share/applications"
  cp "resources/deskthing.desktop" "$pkgdir/usr/share/applications/"
}

