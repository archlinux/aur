# Maintainer: Aaron Miller <aaronm at cldtk dot com>

pkgname=("pivx-daemon" "pivx-cli" "pivx-qt")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=3.1.1
pkgrel=1
arch=("i686" "x86_64")
url="https://pivx.org/"
depends=("boost-libs")
pkgdesc="Transactional security and privacy-focused decentralized open source cryptocurrency "
license=("MIT")
source=("https://github.com/PIVX-Project/PIVX/archive/v$pkgver.tar.gz")
source_i686=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-i686-pc-linux-gnu.tar.gz")
source_x86_64=("https://github.com/PIVX-Project/PIVX/releases/download/v$pkgver/pivx-$pkgver-x86_64-linux-gnu.tar.gz")
sha256sums=("b85f50a0e149ac2402b8d0fe155c7252163c825e0a6410d198b9c3ebc796fdf2")
sha256sums_i686=("4e267b98f4f0723363985549612053e2cb341ddd676f69a5300a333fc52dcb9d")
sha256sums_x86_64=("aac5b13beb9ff96b0ce62d2258d54166c756c8336672a67c7aae6b73a76b0c03")

package_pivx-daemon() {
  pkgdesc+="(daemon)"
  depends+=("openssl" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${pkgver}"
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

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivx-cli"	"${pkgdir}/usr/bin/pivx-cli"
  install -Dm755 "bin/pivx-tx"	"${pkgdir}/usr/bin/pivx-tx"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "COPYING"	"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

package_pivx-qt() {
  pkgdesc+="(Qt)"
  depends+=("qt5-base" "protobuf" "qrencode" "miniupnpc" "db4.8")

  cd "${srcdir}/${pkgbase}-${pkgver}"
  install -Dm755 "bin/pivx-qt"				"${pkgdir}/usr/bin/pivx-qt"

  cd "${srcdir}/${_pkgbase}-${pkgver}"
  install -Dm644 "contrib/debian/pivx-qt.desktop"	"${pkgdir}/usr/share/applications/pivx.desktop"
  install -Dm644 "share/pixmaps/bitcoin128.png"		"${pkgdir}/usr/share/pixmaps/pivx128.png"
  install -Dm644 "contrib/debian/manpages/pivx-qt.1"	"${pkgdir}/usr/share/man/man1/pivx-qt.1"
  install -Dm644 "COPYING"				"${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}
