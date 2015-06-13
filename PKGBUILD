# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>
# Maintainer: Nikolay Amiantov <nikoamia@gmail.com>
# Maintainer: Netanel Shine <netanel at archlinux.org.il>

pkgname=trace-cmd-git
pkgver=2.5.r13.g1788a44
pkgrel=1
pkgdesc="user-space front-end command-line tool for Ftrace, inclduing the GUI interface application kernelshark as well as trace-graph and trace-view."
arch=('i686' 'x86_64')
url="http://git.kernel.org/?p=linux/kernel/git/rostedt/trace-cmd.git"
license=('GPL2')
depends=('python2' 'gtk2')
makedepends=('git' 'pygtk' 'swig' 'docbook-xsl' 'asciidoc')
provides=("trace-cmd")
conflicts=("trace-cmd")
source=("git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git")
sha1sums=("SKIP")

pkgver() {
  cd "$srcdir/trace-cmd"

  git describe --long | sed -r 's/^trace.cmd.v//; s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/trace-cmd"
}

build() {
  cd "$srcdir/trace-cmd"
  
  make PYTHON_VERS=python2 all gui doc
}

package() {
  cd "${srcdir}/trace-cmd"

  make PYTHON_VERS=python2 prefix="/usr" DESTDIR="$pkgdir" install install_gui install_doc
}
