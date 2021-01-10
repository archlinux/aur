# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=xmon
pkgver=1.5.6
pkgrel=1
pkgdesc="X11 protocol tracer, akin to strace"
arch=(x86_64)
url="ftp://ftp.gwdg.de/pub/x11/x.org/contrib/devel_tools/xmon.$pkgver.README"
license=(MIT)
source=("ftp://ftp.gwdg.de/pub/x11/x.org/contrib/devel_tools/xmon.$pkgver.tar.gz"
        'build-fix.patch')
sha256sums=('f920f0916a087a857ae8ec1c805f1590ba8c74d6629d1da15e84c00fc01ca5f0'
            '93811af55f5d365ae9be45f3f85963dc2be9768de77b2a287500e2d58f7e4b7c')
depends=(libxaw libxt libxmu libxext libx11)

prepare() {
  cd xmon.$pkgver
  patch -sp1 -i ../build-fix.patch
}

build() {
  cd xmon.$pkgver
  make -f Makefile.std
}

package() {
  cd xmon.$pkgver

  install -d "$pkgdir"/usr/bin
  install -m755 xmon{d,ui} "$pkgdir"/usr/bin

  install -d "$pkgdir"/usr/share/man/man1
  install -m644 xmon.man "$pkgdir"/usr/share/man/man1/xmon.1
  ln -s xmon.1 "$pkgdir"/usr/share/man/man1/xmond.1
  ln -s xmon.1 "$pkgdir"/usr/share/man/man1/xmonui.1
}
