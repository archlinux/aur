pkgname=("pivx-daemon" "pivx-cli" "pivx-qt" "pivx-sapling-params")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=5.4.0
pkgrel=1
arch=("i686" "x86_64" "armv7h")
url="https://pivx.org/"
#depends=("boost-libs")
pkgdesc="Transactional security and privacy-focused decentralized open source cryptocurrency "
license=("MIT")
source=("https://github.com/PIVX-Project/PIVX/archive/v$pkgver.tar.gz")
source_i686=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-i686-linux-gnu.tar.gz")
source_x86_64=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-x86_64-linux-gnu.tar.gz")
source_armv7h=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-arm-linux-gnueabihf.tar.gz")
sha256sums=("d56c34c3046d955a4ab7e7416675f4d430f443f972d202aef97a4a4f58265554")
sha256sums_i686=("2129ba5d05dce7f60965fe2270d00c4820a264321de8ba39486865fa4c95226c")
sha256sums_x86_64=("fff3d6a772a22a883515568f1532aa600d35e49ecb0c4f7f084302308b857aa3")
sha256sums_armv7h=("cd932a876235127fd62c41db83627c1ed311cc4af85f2cd7151331495f3ad449")

package_pivx-daemon() {
  pkgdesc+="(daemon)"
  depends+=("pivx-sapling-params")
  #depends+=("openssl" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivxd"				"${pkgdir}/usr/bin/pivxd"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "contrib/debian/examples/pivx.conf"	"${pkgdir}/usr/share/doc/${pkgname}/examples/pivx.conf"
  install -Dm644 "contrib/init/pivxd.service"		"${pkgdir}/usr/lib/systemd/system/pivxd.service"
  install -Dm644 "doc/man/pivxd.1"			"${pkgdir}/usr/share/man/man1/pivxd.1"
}

package_pivx-cli() {
  pkgdesc+="(CLI)"
  #depends+=("openssl")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivx-cli"				"${pkgdir}/usr/bin/pivx-cli"
  install -Dm755 "bin/pivx-tx"				"${pkgdir}/usr/bin/pivx-tx"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
  install -Dm644 "doc/man/pivx-cli.1"			"${pkgdir}/usr/share/man/man1/pivx-cli.1"
  install -Dm644 "doc/man/pivx-tx.1"			"${pkgdir}/usr/share/man/man1/pivx-tx.1"
}

package_pivx-qt() {
  pkgdesc+="(Qt)"
  depends+=("pivx-sapling-params")
  #depends+=("qt5-base" "protobuf" "qrencode" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivx-qt"				"${pkgdir}/usr/bin/pivx-qt"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/debian/pivx-qt.desktop"	"${pkgdir}/usr/share/applications/pivx.desktop"
  install -Dm644 "share/pixmaps/pivx128.png"		"${pkgdir}/usr/share/pixmaps/pivx128.png"
  install -Dm644 "doc/man/pivx-qt.1"			"${pkgdir}/usr/share/man/man1/pivx-qt.1"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pivx-sapling-params() {
  pkgdesc+="(sapling parameters)"

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm644 "share/pivx/sapling-spend.params"	"${pkgdir}/usr/local/share/sapling-spend.params"
  install -Dm644 "share/pivx/sapling-output.params"	"${pkgdir}/usr/local/share/sapling-output.params"
}


