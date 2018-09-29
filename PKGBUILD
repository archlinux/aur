# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=trace-cmd
pkgver=2.7
pkgrel=2
pkgdesc="user-space front-end command-line tool for Ftrace, inclduing the GUI interface application kernelshark as well as trace-graph and trace-view."
arch=('x86_64' 'aarch64')
url="http://git.kernel.org/?p=linux/kernel/git/rostedt/trace-cmd.git"
license=('GPL2')
depends=('python2' 'gtk2')
makedepends=('pygtk' 'swig' 'docbook-xsl' 'asciidoc')
provides=('trace-cmd')
conflicts=('trace-cmd-git')
source=("http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git/snapshot/trace-cmd-v${pkgver}.tar.gz")
sha256sums=('5c3b03c701d124c36b127fd73909725e673105df0d39048a7b78ddf209ea15fb')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  
  make PYTHON_VERS=python2 all gui doc
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make PYTHON_VERS=python2 prefix="/usr" DESTDIR="$pkgdir" install install_gui install_doc
}
