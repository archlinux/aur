# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>
# Contributor: Philippe Hürlimann <p@hurlimann.org>
# Contributor: Julian Raufelder <aur@raufelder.com>
# Contributor: Dhina17 <dhinalogu@gmail.com>
# Contributor: Kordian Bruck <k@bruck.me>
# Maintainer: Scott Warner <Tortel1210-at-gmail-dot-com>

pkgname=android-studio-for-platform
pkgver=2023.1.1.19
pkgrel=2
pkgdesc="The official Android IDE for Platform Development"
arch=('x86_64')
url="https://developer.android.com/studio/platform"
license=('APACHE')
makedepends=()
depends=('alsa-lib' 'freetype2' 'libxrender' 'libxtst' 'which')
optdepends=('gtk2: GTK+ look and feel'
            'libgl: emulator support'
            'ncurses5-compat-libs: native debugger support')
options=('!strip')

# https://dl.google.com/android/asfp/asfp-2023.1.1.19-linux.deb
source=("https://dl.google.com/android/asfp/asfp-$pkgver-linux.deb"
        "$pkgname.desktop"
        "license.html")
sha256sums=('e4fa09fa5df9cbae249d69a3d92ef0d121b7b5c6628baff9558c66e3ae0ca0a4'
            '7d8615a69925b0685775546873997bdb967426e24b4fc265d120a04dc8367dda'
            '9a7563f7fb88c9a83df6cee9731660dc73a039ab594747e9e774916275b2e23e')

package() {
  bsdtar -xf data.tar.xz -C "$pkgdir/"

  # Install the application
  install -d $pkgdir/{opt/$pkgname,usr/bin}
  #cp -a bin lib jbr plugins license LICENSE.txt build.txt product-info.json $pkgdir/opt/$pkgname
  ln -s /opt/android-studio-for-platform/bin/studio.sh $pkgdir/usr/bin/$pkgname

  # Copy licenses
  install -Dm644 $pkgdir/opt/$pkgname/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 $srcdir/license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  # Add the icon and desktop file
  install -Dm644 $pkgdir/opt/$pkgname/bin/studio.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  chmod -R ugo+rX $pkgdir/opt
}
