# Maintainer: Aaron Miller <aaronm at cldtk dot com>

pkgname=("pivx-daemon" "pivx-cli" "pivx-qt")
pkgbase=pivx
_pkgbase=${pkgbase^^}
pkgver=3.0.4
pkgrel=1
arch=("i686" "x86_64")
url="https://pivx.org/"
depends=("boost-libs")
pkgdesc="Transactional security and privacy-focused decentralized open source cryptocurrency "
license=("MIT")
source=("https://github.com/PIVX-Project/PIVX/archive/v3.0.4.tar.gz")
source_i686=("https://github.com/PIVX-Project/PIVX/releases/download/v3.0.4/pivx-3.0.4-i686-pc-linux-gnu.tar.gz")
source_x86_64=("https://github.com/PIVX-Project/PIVX/releases/download/v3.0.4/pivx-3.0.4-x86_64-linux-gnu.tar.gz")
sha256sums=("51b2286481d3838dc7b2b44d559256e007b85a47242f94b7b25638ac724b6d5f")
sha256sums_i686=("29dec844094e7b76f554ee676afdcbb092b529ec43bf7efabe7cb1d0f47f9c4c")
sha256sums_x86_64=("b862fa00998797bae4982bd7ad03d6ebd4653bba38564c053245c9460094db3e")

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
