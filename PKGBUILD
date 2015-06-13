# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=trace-cmd
pkgver=2.5.3
pkgrel=1
pkgdesc="user-space front-end command-line tool for Ftrace, inclduing the GUI interface application kernelshark as well as trace-graph and trace-view."
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=linux/kernel/git/rostedt/trace-cmd.git"
license=('GPL2')
depends=('python2' 'gtk2')
makedepends=('pygtk' 'swig' 'docbook-xsl' 'asciidoc')
provides=('trace-cmd')
conflicts=('trace-cmd-git')
source=("http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git/snapshot/trace-cmd-v${pkgver}.tar.gz")
sha256sums=('e39cfa4757ec000dde34dd4bdb76819152f49ec114f9288def227518023b5173')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  
  make PYTHON_VERS=python2 all gui doc
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make PYTHON_VERS=python2 prefix="/usr" DESTDIR="$pkgdir" install install_gui install_doc
}
