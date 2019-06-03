# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
# Contributor: Morten Linderud <morten@linderud.pw>
# Contributor: Andreas Krinke <andreas dot krinke at gmx dot de>
pkgname=gephi
pkgver=0.9.2
pkgrel=1
pkgdesc="An interactive graph visualization and exploration platform"
arch=('any')
url="https://gephi.org"
license=('CDDL' 'GPL3')
depends=('java-runtime' 'libxxf86vm' 'java-environment')
makedepends=('gendesk')
options=(!strip)
source=("https://github.com/gephi/gephi/releases/download/v$pkgver/gephi-$pkgver-linux.tar.gz")
sha256sums=('e817c915e666634f924d9ab103da69e4e635bb8a47bcc5ad05c10b89d4cc23f3')

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
