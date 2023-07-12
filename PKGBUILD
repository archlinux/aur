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
pkgver=2022.2.1.20
pkgrel=1
pkgdesc="The official Android IDE (Stable branch)"
arch=('x86_64')
url="https://developer.android.com/"
license=('APACHE')
makedepends=()
depends=('alsa-lib' 'libxtst' 'java-environment=17')
optdepends=('ncurses5-compat-libs: native debugger support')
options=('!strip')
source=("https://dl.google.com/dl/android/studio/ide-zips/$pkgver/android-studio-$pkgver-linux.tar.gz"
        "android-studio.desktop"
        "license.html")
sha256sums=('5fe66e1f870729f42d7ef385d242e4f908d0e40477a531296ab7331c4524fae6'
            '73cd2dde1d0f99aaba5baad1e2b91c834edd5db3c817f6fb78868d102360d3c4'
            '9a7563f7fb88c9a83df6cee9731660dc73a039ab594747e9e774916275b2e23e')
provides=("android-studio")
conflicts=("android-studio")

package() {
  cd $srcdir/android-studio

  # Install the application
  install -dm 755 $pkgdir/usr/{bin,share/{licenses,pixmaps,android-studio}}
  cp -dr --no-preserve='ownership' bin lib plugins $pkgdir/usr/share/android-studio
  cp -dr --no-preserve='ownership' license $pkgdir/usr/share/licenses/idea

  ln -s /usr/share/android-studio/bin/studio.sh $pkgdir/usr/bin/android-studio
  ln -sf /usr/lib/jvm/java-17-openjdk/ $pkgdir/usr/share/android-studio/jbr

  # Copy licenses
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
  install -Dm644 $srcdir/license.html "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  # Add the icon and desktop file
  install -Dm644 bin/studio.png $pkgdir/usr/share/pixmaps/android-studio.png
  install -Dm644 $srcdir/android-studio.desktop $pkgdir/usr/share/applications/android-studio.desktop
}
