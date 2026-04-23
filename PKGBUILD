pkgname=osu-lazer-appimage
pkgver=latest
pkgrel=1
pkgdesc='A free-to-win rhythm game. Rhythm is just a *click* away!'
arch=('x86_64')
license=('GPL')
depends=('fuse' 'bash')
options=('!strip')


pkgver() {
    export version=$(curl -s "https://api.github.com/repos/ppy/osu/releases/latest" | \
        jq -r '.tag_name' | \
        sed 's/-lazer$//')
    curl -s "https://api.github.com/repos/ppy/osu/releases/latest" | \
        jq -r '.tag_name' | \
        sed 's/-lazer$//'
}

version=$(curl -s "https://api.github.com/repos/ppy/osu/releases/latest" | \
        jq -r '.tag_name' | \
        sed 's/-lazer$//')

source=("https://github.com/ppy/osu/releases/download/"$version"-lazer/osu.AppImage" "http://162.19.230.104:2069/windux-builds/Osu-Lazer/osu-lazer" "http://162.19.230.104:2069/windux-builds/Osu-Lazer/osu.desktop" "https://raw.githubusercontent.com/ppy/osu/refs/heads/master/assets/lazer.png")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')
install=osu-lazer-appimage.install

package() {
  mkdir -p $pkgdir/usr/share/icons
  mkdir -p $pkgdir/usr/share/applications
  mkdir -p $pkgdir/opt/osu-lazer-appimage
  mkdir -p $pkgdir/usr/bin

  cp $srcdir/osu.AppImage $pkgdir/opt/osu-lazer-appimage
  cp $srcdir/osu.desktop $pkgdir/usr/share/applications
  cp $srcdir/osu-lazer $pkgdir/usr/bin
  cp $srcdir/lazer.png $pkgdir/usr/share/icons
}
