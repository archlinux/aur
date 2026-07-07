# Maintainer: Jason Landbridge <JasonLandbridge at aur dot archlinux dot org>
# Packaging repository: https://github.com/JasonLandbridge/Arch-Linux-AUR-Packages-Updater/tree/main/qdrant-bin

_pkgname=qdrant
pkgname="${_pkgname}-bin"
pkgver=1.17.0 # renovate: datasource=github-releases depName=qdrant/qdrant
pkgrel=1
pkgdesc="Vector Database for the next generation of AI applications"
arch=('x86_64')
url="https://qdrant.tech"
license=('Apache-2.0')
depends=('gcc-libs' 'glibc')
provides=($_pkgname)
conflicts=($_pkgname)
source_x86_64=("${pkgname}-${pkgver}.deb::https://github.com/qdrant/qdrant/releases/download/v${pkgver}/qdrant_${pkgver}-1_amd64.deb")
sha256sums_x86_64=('a2a9cfe4bd2aa8e188d86404fa1f47ac92253a8b3704ac19b39a796bdd050453')

package() {
  tar -xf data.tar.xz
  install -Dm755 usr/bin/qdrant "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 usr/share/doc/qdrant/copyright -t "${pkgdir}/usr/share/licenses/$_pkgname"
  install -Dm644 usr/share/doc/qdrant/README -t "${pkgdir}/usr/share/doc/$_pkgname"
  install -Dm644 etc/qdrant/config.yaml -t "${pkgdir}/etc/qdrant"
  mv var "${pkgdir}"
  mkdir "${pkgdir}/var/lib/qdrant"/{storage,snapshots}
}
