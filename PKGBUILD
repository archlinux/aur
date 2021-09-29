pkgname=("pivx-daemon" "pivx-cli" "pivx-qt" "pivx-sapling-params")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=5.3.2
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
sha256sums=("0c115e3fb252f685ed9eae20ae9459e1c5d016a3a516912499c222308e541fc7")
sha256sums_i686=("bafa8f653f44a4345b73fde283c4c09cc3054abcc3fe7e5b9871621f2a9134f2")
sha256sums_x86_64=("38599ed85c428a401880eaf625ceccfcf3c7620f751989ad92cae304132f03f8")
sha256sums_armv7h=("a3c9451dfa367014270071fefd9fa5e4e867bdddedf1e18980e6b6451f6a203d")

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


