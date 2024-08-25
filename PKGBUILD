# Maintainer: Rodolphe Fouquet <vachicorne at pm dot me>
pkgname=zoom-vmware-plugin
pkgver=6.0.10
_subver=25100
pkgrel=1
pkgdesc="Zoom VDI VMWare plugin "
arch=('x86_64')
license=('custom')
url="https://support.zoom.us/hc/en-us/articles/4415057249549-VDI-releases-and-downloads"
depends=(
  'vmware-horizon-client'
  'vmware-horizon-rtav'
)
optdepends=()
replaces=()

source=("https://zoom.us/download/vdi/${pkgver}.${_subver}/zoomvdi-universal-plugin-centos_${pkgver}.rpm")

sha512sums=('e91d059079c2203f0efaaa3b02c5e2b1430317eaf39644b5913af0a4339f7a95954caa6afe35dee5f9da8478c9b97ba4ee86ab58bbf16c87cbe7bd074bc76567')

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"

  install -d "$pkgdir/usr/lib/vmware/view/vdpService"

  ln -s /usr/lib/zoomvdi-universal-plugin/libZoomPlugin.so "$pkgdir/usr/lib/vmware/view/vdpService/libZoomMediaVmware.so"
}
