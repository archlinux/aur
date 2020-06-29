# Maintainer: Felix Golatofski <contact@xdfr.de>
# Contributor: zer0def <zer0def on freenode>

pkgname=libpurple-signald-git
pkgver=0.3.0.r1.g6ba26ff
pkgrel=1
pkgdesc='Pidgin libpurple bridge to signald.'
url='https://github.com/hoehermann/libpurple-signald'
license=('GPL3')
arch=('any')
depends=('json-glib' 'libpurple' 'signald')
source=("${pkgname}::git+https://github.com/hoehermann/libpurple-signald")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  install -Dm644 libsignald.so "${pkgdir}/usr/lib/purple-2/libsignald.so"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 icons/16/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/16/signal.png"
  install -Dm644 icons/48/signal.png "${pkgdir}/usr/share/pixmaps/pidgin/protocols/48/signal.png"
}
