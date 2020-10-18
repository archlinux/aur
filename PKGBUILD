# Maintainer: pryme-svg <edoc.www@gmail.com>

pkgname=lightcord-git
pkgver=dev
pkgrel=1
pkgdesc="A simple - customizable - Discord Client"
arch=('x86_64')
url="https://github.com/Lightcord/Lightcord"
license=('MIT')
depends=()
makedepends=('npm' 'nodejs')
conflicts=('lightcord-bin')
source=("git://github.com/Lightcord/Lightcord.git"
	"git://github.com/pryme-svg/lightcord-tools.git"
	"https://raw.githubusercontent.com/Lightcord/LightcordLogos/master/lightcord/lightcord.png")
sha512sums=('SKIP'
	    'SKIP'
	     'SKIP')

build() {
  cd "Lightcord" 
  npm run devInstall:x64 
  npm run build
}

package() {
    # taken from lightcord-bin
    # Create the folder structure
    install -d "$pkgdir"/opt/lightcord
    install -d "$pkgdir"/usr/bin
    install -d "$pkgdir"/usr/share/pixmaps

    # Copy files over and set rights
    cp -a "$srcdir/Lightcord/builds/linux-unpacked"/. "$pkgdir"/opt/lightcord
    cp -a "$srcdir/lightcord.png" "$pkgdir"/opt/lightcord
    chmod 755 "$pkgdir"/opt/lightcord/lightcord
    # Link icon and add Desktop
    ln -s /opt/lightcord/lightcord.png "$pkgdir"/usr/share/pixmaps/lightcord.png
    install -Dm644 "$srcdir"/lightcord-tools/Lightcord.desktop -t "$pkgdir"/usr/share/applications

    # Create symlink in /usr/bin; stolen from other PKGBUILDs
    ln -s /opt/lightcord/lightcord "$pkgdir"/usr/bin/lightcord
}

