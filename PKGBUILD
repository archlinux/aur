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

pkgname=android-studio
pkgver=2026.1.4.7
_vername="quail4"
pkgrel=1
pkgdesc="The official Android IDE (Stable branch)"
arch=('x86_64')
url="https://developer.android.com/"
license=('Apache-2.0')
depends=('alsa-lib' 'fontconfig' 'freetype2' 'libxrender' 'libxtst' 'which')
optdepends=('gtk2: GTK+ look and feel'
            'libbsd: emulator support'
            'libgl: emulator support'
            'libxkbcommon: Wayland support for the bundled runtime'
            'libxkbfile: emulator support'
            'ncurses5-compat-libs: native debugger support'
            'vulkan-icd-loader: Vulkan acceleration for Gemini local models')
options=('!strip')
source=("https://dl.google.com/dl/android/studio/ide-zips/$pkgver/android-studio-$_vername-linux.tar.gz"
        "$pkgname.desktop"
        "license.html")
b2sums=('c4f0dfad8eff9b8d0d9f2040dc9f26f2c60f7330226060ec1c9254f3a2ee8a8296c6be9002c7ef8818b18730d34dbe67b516036c4ad0378c4f4f6ba857571e5a'
        '0b978b7fdbcd277cf432080572b141a760ad169984c9cb09f11c6f3ca0be807483545685c86853329bc4622bf516c7a668148bd25ada906fa7289bb9a7c7ccf8'
        '43b288fb81656cd72826a52620e41fbd0daa65d37246cb5b7dbff9c326022eabf18344513517b16134b557d6ae86535f44f863ebd06d6fe0410f92117c1a8c67')

package() {
  cd "$srcdir/$pkgname" || exit

  # Install the application
  install -d "$pkgdir/opt/$pkgname" "$pkgdir/usr/bin"
  cp -a bin lib jbr plugins license LICENSE.txt build.txt product-info.json "$pkgdir/opt/$pkgname"
  ln -s /opt/android-studio/bin/studio "$pkgdir/usr/bin/$pkgname"

  # Copy licenses
  install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
  install -Dm644 "$srcdir/license.html" "$pkgdir/usr/share/licenses/$pkgname/license.html"

  # Add the icon and desktop file
  install -Dm644 bin/studio.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  chmod -R ugo+rX "$pkgdir/opt"
}
