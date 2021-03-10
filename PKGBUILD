# Maintainer: Klexx <klexx@mailbox.bz> 

pkgname=("pivx-daemon" "pivx-cli" "pivx-qt" "pivx-sapling-params")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=5.0.1
pkgrel=2
arch=("i686" "x86_64" "aarch64")
url="https://pivx.org/"
#depends=("boost-libs")
pkgdesc="Transactional security and privacy-focused decentralized open source cryptocurrency "
license=("MIT")
source=("https://github.com/PIVX-Project/PIVX/archive/v$pkgver.tar.gz")
source_i686=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-i686-linux-gnu.tar.gz")
source_x86_64=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-x86_64-linux-gnu.tar.gz")
source_aarch64=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-aarch64-linux-gnu.tar.gz")
sha256sums=("81d713cb70e1e75e5a89729c856d3345d300697ee8f6fd8fa8c3c120d575e672")
sha256sums_i686=("86e020f6307913d3287fe58b1328a0892ae8588dcd96156414c1361295968a3d")
sha256sums_x86_64=("b2e043a4cba9e913bf6a62a7d33f307bcb8d103fb7d285f6608ff2918d61feff")
sha256sums_aarch64=("bf340f82ae5e3958da430f40d303a42324b01b9f8860347615ff0a6d5f62e802")

package_pivx-daemon() {
  pkgdesc+="(daemon)"
  depends+=("pivx-sapling-params")
  #depends+=("openssl" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivxd"				"${pkgdir}/usr/bin/pivxd"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/init/pivxd.service"		"${pkgdir}/usr/lib/systemd/system/pivxd.service"
  install -Dm644 "contrib/debian/examples/pivx.conf"	"${pkgdir}/usr/share/doc/${pkgname}/examples/pivx.conf"
  install -Dm644 "doc/man/pivxd.1"			"${pkgdir}/usr/share/man/man1/pivxd.1"
  #install -Dm644 "contrib/debian/manpages/pivx.conf.5"	"${pkgdir}/usr/share/man/man5/pivx.conf.5"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

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

  install -Dm644 "share/pivx/sapling-spend.params"			"${pkgdir}/usr/local/share/sapling-spend.params"
  install -Dm644 "share/pivx/sapling-output.params"			"${pkgdir}/usr/local/share/sapling-output.params"  
}


