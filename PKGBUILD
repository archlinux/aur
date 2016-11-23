# Maintainer: Guillaume Gauvrit <guillaume@gauvr.it>
pkgname=starleaf-breeze
pkgver=1.6.12
pkgrel=2
pkgdesc="StarLeaf Breeze voice and video softclient"
arch=('i686' 'x86_64')
url="http://support.starleaf.com/downloads"
license=('custom:starleaf')
# depends=('libappindicator3' 'libnotify4')
makedepends=('pacman>=4.2.0')
options=('!emptydirs' '!strip')
source=("${pkgname}_${pkgver}.deb::http://downloads.starleaf.com/breeze_downloads/StarLeaf-Breeze-Installer-Ubuntu.deb")
md5sums=('ea07fdd1a213dc30fbb51edc8e54331e')

package() {
  msg2 "Extracting starleaf-breeze_1.6.2.deb to $pkgdir/..."
  bsdtar -xf starleaf-breeze_1.6.2.deb -C "$pkgdir/"
  bsdtar -xf "$pkgdir/data.tar.gz" -C "$pkgdir/"
  rm "$pkgdir"/control.tar.gz
  rm "$pkgdir"/data.tar.gz
  rm "$pkgdir"/debian-binary
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/64x64/apps/
  mkdir -p "$pkgdir"/usr/share/icons/hicolor/128x128/apps/
  cp "$pkgdir"/usr/share/icons/hicolor/48x48/apps/starleaf-breeze.png "$pkgdir"/usr/share/icons/hicolor/64x64/apps/starleaf-breeze.png
  cp "$pkgdir"/usr/share/icons/hicolor/48x48/apps/starleaf-breeze.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/starleaf-breeze.png

}

# Colored makepkg-like functions
msg_blue() {
    printf "${blue}==>${bold} $1${all_off}\n"
}

note() {
    printf "${blue}==>${yellow} NOTE:${bold} $1${all_off}\n"
}

all_off="$(tput sgr0)"
bold="${all_off}$(tput bold)"
blue="${bold}$(tput setaf 4)"
yellow="${bold}$(tput setaf 3)"

_update() {
    msg_blue "Updating desktop MIME database..."
    update-desktop-database -q
    
    msg_blue "Updating icon cache.."
    xdg-icon-resource forceupdate --theme hicolor &>/dev/null
}

post_install() {
    _update
    note "The launcher is called: 'starleaf-breeze'"
}

post_upgrade() {
    post_install
}

post_remove() {
    _update
}
