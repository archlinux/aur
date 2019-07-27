# Current Maintainer: Troy Engel <troyengel+arch@gmail.com>

pkgname=trace-cmd
pkgver=2.8.3
pkgrel=1
pkgdesc="Userspace tooling for the Linux kernel Ftrace internal tracer"
arch=('x86_64' 'aarch64')
url="https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git"
license=('GPL2')
makedepends=('python' 'swig' 'asciidoc')
optdepends=('python: for the Python plugins')
provides=('trace-cmd')
conflicts=('trace-cmd-git')
source=("https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/snapshot/trace-cmd-v${pkgver}.tar.gz")
sha256sums=('706564b147bd966957431c4ca70032947d59c5d977c1ac2942b1b5a8668e7a6f')

build() {
  cd "${srcdir}/${pkgname}-v${pkgver}"
  
  make PYTHON_VERS=python3 all doc
}

package() {
  cd "${srcdir}/${pkgname}-v${pkgver}"

  make PYTHON_VERS=python3 prefix="/usr" DESTDIR="$pkgdir" \
    install install_doc

  # Remove the KernelShark docs from this package
  rm -rf "${pkgdir}/usr/share/kernelshark"
  rm -f "${pkgdir}/usr/share/man/man1/kernelshark.1"
}
