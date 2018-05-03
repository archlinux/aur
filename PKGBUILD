# Maintainer: Aaron Miller <aaronm at cldtk dot com>

pkgname=("pivx-daemon" "pivx-cli" "pivx-qt")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=3.1.0.2
_pkgdirver=3.1.0
pkgrel=1
arch=("i686" "x86_64")
url="https://pivx.org/"
depends=("boost-libs")
pkgdesc="Transactional security and privacy-focused decentralized open source cryptocurrency "
license=("MIT")
source=("https://github.com/PIVX-Project/PIVX/archive/v$pkgver.tar.gz")
source_i686=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-i686-pc-linux-gnu.tar.gz")
source_x86_64=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=("50db22d2a8188cee03c81c57e361ba80bf80d60747dbe89c1fd186a3198f64d0")
sha256sums_i686=("70e62cf936cfa189eb479110e5d727e162d41fc15490e93868f8b7e742883f8a")
sha256sums_x86_64=("0ea18dcbefacd211739e1a64fe80e70cd6b9bf3f5d82b111e6c2aa2f271a35c5")

package_pivx-daemon() {
  pkgdesc+="(daemon)"
  depends+=("openssl" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${_pkgdirver}"
  install -Dm755 "bin/pivxd"				"${pkgdir}/usr/bin/pivxd"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/init/pivxd.service"		"${pkgdir}/usr/lib/systemd/system/pivxd.service"
  install -Dm644 "contrib/debian/examples/pivx.conf"	"${pkgdir}/usr/share/doc/${pkgname}/examples/pivx.conf"
  install -Dm644 "contrib/debian/manpages/pivxd.1"	"${pkgdir}/usr/share/man/man1/pivxd.1"
  install -Dm644 "contrib/debian/manpages/pivx.conf.5"	"${pkgdir}/usr/share/man/man5/pivx.conf.5"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pivx-cli() {
  pkgdesc+="(CLI)"
  depends+=("openssl")

  cd "${srcdir}/${pkgbase}-${_pkgdirver}"
  install -Dm755 "bin/pivx-cli"	"${pkgdir}/usr/bin/pivx-cli"
  install -Dm755 "bin/pivx-tx"	"${pkgdir}/usr/bin/pivx-tx"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "COPYING"	"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pivx-qt() {
  pkgdesc+="(Qt)"
  depends+=("qt5-base" "protobuf" "qrencode" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${_pkgdirver}"
  install -Dm755 "bin/pivx-qt"				"${pkgdir}/usr/bin/pivx-qt"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/debian/pivx-qt.desktop"	"${pkgdir}/usr/share/applications/pivx.desktop"
  install -Dm644 "share/pixmaps/bitcoin128.png"		"${pkgdir}/usr/share/pixmaps/pivx128.png"
  install -Dm644 "contrib/debian/manpages/pivx-qt.1"	"${pkgdir}/usr/share/man/man1/pivx-qt.1"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
