# Maintainer: Alfin Bakhtiar Ilhami <alfin at nuclea dot id>

pkgname=marktext-bin
_pkgname=marktext
pkgver=0.14.0.rc.1
_pkgver=0.14.0-rc.1
pkgrel=1
pkgdesc='A simple and elegant open-source markdown editor that focused on speed and usability.'
arch=('x86_64')
url='https://marktext.app'
license=('MIT')
provides=('marktext')
conflicts=('marktext')
source=(https://github.com/marktext/marktext/releases/download/v$_pkgver/$_pkgname-$_pkgver-x64.tar.gz
        icon48.png::https://github.com/marktext/marktext/raw/master/resources/icons/48x48/marktext.png
        icon64.png::https://github.com/marktext/marktext/raw/master/resources/icons/64x64/marktext.png
        icon128.png::https://github.com/marktext/marktext/raw/master/resources/icons/128x128/marktext.png
        icon256.png::https://github.com/marktext/marktext/raw/master/resources/icons/256x256/marktext.png
        icon512.png::https://github.com/marktext/marktext/raw/master/resources/icons/512x512/marktext.png
        https://raw.githubusercontent.com/marktext/marktext/master/resources/linux/marktext.desktop
        )
sha256sums=('05675e228a71c366774410db24af582f7fc4bc0e535e870268199de09fc21200'
            'e2f07abbbed4bc6f146cef52958ebec5ec8ed6e606a884934430d3525a2bbae7'
            'e2f07abbbed4bc6f146cef52958ebec5ec8ed6e606a884934430d3525a2bbae7'
            '5dcee26e0a80b78534a71af0b6e5b425e0e030f31c1880699923999b22848536'
            'd00f87911e70a76a4a9eb13da40e535fd2aa99486c768c1906156b6ba5df7c1b'
            'bb55503655caa407094514c9f086aca13ebd66bd178bfe3394c63464a66ba727'
            'b4b32ec6708bff77de07521fd3870bf0bd8a4ad094e52e80ca47d0390783c86d')

prepare() {
  sed -i "s|Exec=.*|Exec=/usr/lib/marktext/marktext %F|" $srcdir/$_pkgname.desktop
}

package() {
  install -d $pkgdir/usr/lib
  cp -rT $srcdir/$_pkgname-$_pkgver-x64 $pkgdir/usr/lib/$_pkgname

  # Install desktop entry
  install -Dm644 $srcdir/$_pkgname.desktop \
  $pkgdir/usr/share/applications/$_pkgname.desktop

  # Install icons
  for s in 48 64 128 256 512; do
    install -Dm644 $srcdir/icon$s.png \
    $pkgdir/usr/share/icons/hicolor/${s}x${s}/apps/$_pkgname.png
  done
  install -Dm644 $srcdir/icon512.png $pkgdir/usr/share/pixmaps/$_pkgname.png

  # Install license
  for i in LICENSE LICENSE.electron.txt LICENSES.chromium.html; do
    install -Dm644 $srcdir/$_pkgname-$_pkgver-x64/$i \
    $pkgdir/usr/share/licenses/$_pkgname/$i
  done
}
