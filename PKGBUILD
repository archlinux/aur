# Maintainer: Susurri <susurrus dot silent at gmail dot com>
# Contributor: Miten <git dot pub at icloud dot com>
# Contributor: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin
pkgver=5.9.1
pkgrel=1
pkgdesc="Binary builds of the Swift programming language"
arch=('x86_64')
url="https://www.swift.org/"
license=('apache')
depends=('libutil-linux' 'libxml2' 'ncurses5-compat-libs')
optdepends=('python36: required for REPL')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://download.swift.org/swift-$pkgver-release/centos7/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-centos7.tar.gz")
sha256sums=('85f76d092e50794cafc45229d6534c02abb25f4f62f8d923c83b2e7c08a6eada')

package() {
  mkdir -p "${pkgdir}/usr/lib/swift"
  cp -Ppr "${srcdir}/swift-$pkgver-RELEASE-centos7"/usr/* "${pkgdir}/usr/lib/swift"

  # Symlink the desired binaries to /usr/bin
  mkdir -p "${pkgdir}/usr/bin"
  for bin in sourcekit-lsp swift swiftc; do
    ln -s "/usr/lib/swift/bin/$bin" "${pkgdir}/usr/bin/$bin"
  done

  install -dm755 "${pkgdir}/etc/ld.so.conf.d"
  echo '/usr/lib/swift/lib/swift/linux' >> "${pkgdir}/etc/ld.so.conf.d/swift.conf"
}
