# Maintainer: Sam Burgos < sam dot burgos1089 at gmail dot com >

pkgname=mintstick
pkgver=1.3.9
pkgrel=1
pkgdesc="A GUI to write .img or .iso files to a USB Key. It can also format them"
arch=('any')
url="http://packages.linuxmint.com/pool/main/m/${pkgname}"
license=('GPL')
depends=('coreutils'
    'desktop-file-utils'    
    'dosfstools'
    'e2fsprogs'
    'exfat-utils'
    'glib2'
    'gtk3'
    'ntfs-3g'
    'parted'
    'polkit'
    'procps-ng'
    'python2'
    'python2-dbus'
    'python2-gobject'
    'python2-pyparted'
    'python2-xapp'
    'udisks2'
    'util-linux'
    'xapps')
makedepends=('gettext')
conflicts=("mintstick-git")
source=("${pkgname}-${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('249bc73da12bf111747e8b1eb821f111779d3dc5cf5024cea33b1afedb6213fb')

prepare() {
  cd ${pkgname}
  ## https://wiki.archlinux.org/index.php/Arch_packaging_standards#Directories
  sed -i 's| /usr| "'$pkgdir'"/usr|g' install.sh

  ## Removing all instances of KDE4, since Linux Mint KDE Edition is no longer available
  rm -rf 'share/kde4'
}

package() {
  cd ${pkgname}

  ## Creating the directories to copy the files
  install -d "$pkgdir/usr/bin"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/share/polkit-1/actions"
  cp -rp share/nemo "$pkgdir/usr/share"

  ## install.sh script is the one who contains all the installation process
  ./install.sh
}
