# Maintainer: Konstantin Gizdov <arch at kge dot pw>
# Contributor: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=gephi
pkgver=0.9.5
pkgrel=1
pkgdesc="An interactive graph visualization and exploration platform"
arch=('x86_64')
url="https://gephi.org"
license=('CDDL' 'GPL3')
depends=('java-runtime=11' 'java-environment=11' 'libxxf86vm')
makedepends=('gendesk')
options=(!strip)
source=("https://github.com/gephi/gephi/releases/download/v$pkgver/gephi-$pkgver-linux-x64.tar.gz")
sha256sums=('20796de0af955011b92ef83b4c2deb58167138c46ddcc10f544050f0ee5b197f')

prepare() {
  gendesk -n --name "Gephi - The Open Graph Viz Platform" \
    --pkgname "$pkgname" \
    --pkgdesc "$pkgdesc"
}

package() {
  cd "$srcdir/gephi-${pkgver}"
  install -d "${pkgdir}/usr/share/java/${pkgname}"
  cp -r * "${pkgdir}/usr/share/java/${pkgname}"
  install -d "${pkgdir}/usr/bin"
  ln -s "/usr/share/java/${pkgname}/bin/gephi" "${pkgdir}/usr/bin/gephi"

  find "${pkgdir}" -type f -iname \*.dll -delete
  find "${pkgdir}" -type f -iname \*.exe -delete
  find "${pkgdir}" -type f -name .lastModified -delete

  install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
