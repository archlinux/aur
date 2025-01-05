# Maintainer: Xtr126 <k.gunetilleke@gmail.com>

pkgname="android-x86-installer-tauri-bin"
pkgver="1.0.0"
pkgrel=1
pkgdesc="Android x86 Installer"
arch=("x86_64")
license=("APACHE")
url="https://github.com/Xtr126/Android-x86-installer"

depends=(
    'webkit2gtk-4.1'
    'libarchive' 
    'cairo' 
    'desktop-file-utils' 
    'gdk-pixbuf2' 
    'glib2' 
    'gtk3' 
    'hicolor-icon-theme' 
    'libsoup' 
    'pango'
)

source=("https://github.com/Xtr126/Android-x86-installer/releases/download/app-v${pkgver}/android-x86-installer_${pkgver}_amd64.deb")

sha256sums=('57ba5099294f2c33723d6c4731ec9b4fbe67038befac5c1b1a15b8e97d71f0fc')

package() {
  cd "$srcdir"
  bsdtar -xf ${srcdir}/data.tar.gz -C ${pkgdir}/
}

post_install() {
   gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
   update-desktop-database -q
}

post_upgrade() {
   post_install
}

post_remove() {
   gtk-update-icon-cache -q -t -f usr/share/icons/hicolor
   update-desktop-database -q
}

