# Maintainer: <mumei AT airmail DOT cc>

_pkgname=TextEdit
pkgname=textedit-classic.app
pkgrel=1
pkgver=0.95_pre20100427
pkgdesc='A text editor with font, color, and style capabilities for GNUstep'
arch=('i686' 'x86_64' 'armv7h')
url='http://www.nongnu.org/backbone/'
license=('GPL')
groups=('gnustep-apps')
depends=('gnustep-base' 'gnustep-gui' 'gnustep-back')
makedepends=('gcc-objc' 'gnustep-make')
conflicts=('textedit.app')
source=("https://mirrors.lug.mtu.edu/gentoo/distfiles/textedit-0.95_pre20100427.tar.gz"
"https://gitweb.gentoo.org/repo/gentoo.git/plain/gnustep-apps/textedit/files/textedit-0.95_pre20100427-gcc47.patch"
"https://gitweb.gentoo.org/repo/gentoo.git/plain/gnustep-apps/textedit/files/textedit-0.95_pre20100427-nsinvalidargument.patch")
sha256sums=("SKIP" "SKIP" "SKIP")

prepare() {
  cd $_pkgname
  for patch in ../*.patch; do
    patch < $patch
  done
}

build() {
  cd $_pkgname
  export GNUSTEP_MAKEFILES="$(gnustep-config --variable=GNUSTEP_MAKEFILES)"
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
  install -Dm644 "$pkgdir/usr/lib/GNUstep/Applications/$_pkgname.app/Resources/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
}
