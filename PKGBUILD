# Contributor: Daniele Basso  <d dot bass05 at proton dot me>
# Contributor:  danyf90 <daniele.formichelli@gmail.com>
# Contributor: Philipp 'TamCore' B. <philipp [at] tamcore [dot] eu>
# Contributor: Jakub Schmidtke <sjakub-at-gmail-dot-com>
# Contributor: Christoph Brill <egore911-at-gmail-dot-com>
# Contributor: Lubomir 'Kuci' Kucera <kuci24-at-gmail-dot-com>
# Contributor: Tad Fisher <tadfisher at gmail dot com>
# Contributor: Philippe Hürlimann <p@hurlimann.org>
# Contributor: Julian Raufelder <aur@raufelder.com>
# Contributor: Dhina17 <dhinalogu@gmail.com>
# Maintainer: Kordian Bruck <k@bruck.me>

pkgname=android-studio-system
pkgver=2021.3.1.17
pkgrel=1
pkgdesc="The official Android IDE (Stable branch)"
arch=('x86_64')
url="https://developer.android.com/"
license=('APACHE')
makedepends=()
depends=('alsa-lib' 'libxtst' 'java-environment=11')
optdepends=('ncurses5-compat-libs: native debugger support')
options=('!strip')
source=("https://dl.google.com/dl/android/studio/ide-zips/$pkgver/android-studio-$pkgver-linux.tar.gz"
        "android-studio.desktop"
        "license.html")
sha256sums=('89adb0ce0ffa46b7894e7bfedb142b1f5d52c43c171e6a6cb9a95a49f77756ca'
            '73cd2dde1d0f99aaba5baad1e2b91c834edd5db3c817f6fb78868d102360d3c4'
            '9a7563f7fb88c9a83df6cee9731660dc73a039ab594747e9e774916275b2e23e')

package() {
  cd $srcdir/$pkgname

  # Install the application
  install -dm 755 $pkgdir/usr/{bin,share/{licenses,pixmaps,$pkgname}}
  cp -dr --no-preserve='ownership' bin lib plugins $pkgdir/usr/share/$pkgname
  cp -dr --no-preserve='ownership' license $pkgdir/usr/share/licenses/idea

  ln -s /usr/share/$pkgname/bin/studio.sh $pkgdir/usr/bin/$pkgname
  ln -sf /usr/lib/jvm/java-11-openjdk/ $pkgdir/usr/share/$pkgname/jre

  # Copy licenses
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 $srcdir/license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  # Add the icon and desktop file
  install -Dm644 bin/studio.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 $srcdir/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
