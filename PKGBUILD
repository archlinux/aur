# Contributor: Charles Dong <chardon_cs@proton.me>
# Contributor: tee < teeaur at duck dot com >

_pkgname=qdrant
pkgname=${_pkgname}-bin
pkgver=1.16.3
pkgrel=2
pkgdesc="Vector Database for the next generation of AI applications"
arch=('x86_64')
url="https://qdrant.tech"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
makedepends=()
provides=('qdrant')
conflicts=('qdrant')
source_x86_64=("https://github.com/qdrant/qdrant/releases/download/v${pkgver}/qdrant_${pkgver}-1_amd64.deb")
sha256sums_x86_64=('77a29228349727ce7136c02de44022952efb2913bc5a1034dd02c11aab1ff687')

package() {
  tar -xf data.tar.xz
  install -Dm755 usr/bin/qdrant "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 usr/share/doc/qdrant/copyright -t "${pkgdir}/usr/share/licenses/$_pkgname"
  install -Dm644 usr/share/doc/qdrant/README -t "${pkgdir}/usr/share/doc/$_pkgname"
  install -Dm644 etc/qdrant/config.yaml -t "${pkgdir}/etc/qdrant"
  mv var "${pkgdir}"
  mkdir "${pkgdir}/var/lib/qdrant"/{storage,snapshots}
}
