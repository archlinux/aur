# Maintainer: Sebastian Lau <lauseb644@gmail.com>
# Contributor: Serede Sixty Six <serede.dev@gmail.com>, ptrxyz <ptrxyz@gmx.de>

pkgname=nemo-terminal
pkgver=3.4.0
pkgrel=1
pkgdesc="An embedded terminal for Nemo, the Cinnamon file manager."
arch=('any')
url="https://github.com/linuxmint/nemo-extensions"
license=('GPL2')
groups=('nemo-extensions')
depends=('nemo>=3.2' 'nemo-python' 'vte3' 'gobject-introspection-runtime' 'gdk-pixbuf2' 'gtk3')
optdepends=("python2-xdg: Integration with freedesktop.org standards")

options=('!libtool' '!emptydirs')

source=("nemo-extensions-$pkgver.tar.gz::https://github.com/linuxmint/nemo-extensions/archive/$pkgver.tar.gz")
sha256sums=('68dadce98c17321c3c22e596452a1b7aa0842c5faa05688734430857e037b3f2')


prepare() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  # Python2 fix
  msg2 "Fixing to use python2..."
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}


package() {
  cd "${srcdir}/nemo-extensions-${pkgver}/${pkgname}"

  install -d ${pkgdir}/usr/share/nemo-python/extensions
  install -d ${pkgdir}/usr/share/glib-2.0/schemas
  install -d ${pkgdir}/usr/share/nemo-terminal
  install src/nemo_terminal.py ${pkgdir}/usr/share/nemo-python/extensions
  install src/org.nemo.extensions.nemo-terminal.gschema.xml ${pkgdir}/usr/share/glib-2.0/schemas
  install pixmap/logo_120x120.png ${pkgdir}/usr/share/nemo-terminal
}
