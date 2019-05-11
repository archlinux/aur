# Maintainer: <mumei AT airmail DOT cc>

_pkgname=TextEdit
pkgname=textedit.app
pkgrel=3
pkgver=264
pkgdesc='GNUstep port of OS X 10.6 TextEdit'
arch=('i686' 'x86_64' 'armv7h')
url='https://github.com/ericwa/TextEdit'
license=('BSD')
groups=('gnustep-apps')
#[UPSTREAM-BUG] Program will hang without a working aspell dictionary
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back' 'aspell-en')
makedepends=('gcc-objc' 'gnustep-make')
conflicts=('textedit-classic.app')
source=("https://github.com/ericwa/TextEdit/archive/master.zip"
        "http://http.debian.net/debian/pool/main/t/textedit.app/textedit.app_5.0-2.debian.tar.xz")
sha256sums=('13fb1df424d69eeb95f1ba8c6c9c4cfd039798dc5b01b20760d79d532a374b07'
            '3ddd98df28ce9448b7f19f42fedf8fb485e84c30fc011b9f309b5e87b879dd19')

prepare() {
  cd "TextEdit-master"
  for patch in ../debian/patches/*.patch; do 
    patch < $patch
  done
}

build() {
  cd "TextEdit-master"
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd "TextEdit-master"
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
