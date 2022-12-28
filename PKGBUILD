# Maintainer: Susurri <susurrus dot silent at gmail dot com>
# Contributor: Miten <git dot pub at icloud dot com>
# Contributor: Ryan Gonzalez <rymg19 at gmail dot com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>, youngunix <>

pkgname=swift-bin
pkgver=5.7.2
pkgrel=1
pkgdesc="Binary builds of the Swift programming language"
arch=('x86_64')
url="https://swift.org"
license=('apache')
depends=('libutil-linux' 'libxml2' 'ncurses5-compat-libs')
optdepends=('python36: required for REPL')
options=('!strip')
provides=('swift-language')
replaces=('swift-language-bin')
source=("https://swift.org/builds/swift-$pkgver-release/centos7/swift-$pkgver-RELEASE/swift-$pkgver-RELEASE-centos7.tar.gz")
sha256sums=('8622569f57c7e325ab02d5f6605e55d1e1fe04ab7ccae8fab8334532959750c6')

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
