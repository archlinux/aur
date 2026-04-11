# Maintainer: Joe <joe@kitsunehosting.net>
pkgname=dxf-thumbnailer
pkgver=0.1
pkgrel=1
pkgdesc="Freedesktop thumbnailer for DXF CAD files (Python, by Yorik van Havre)"
arch=('any')
url="https://yorik.uncreated.net/archive/scripts/dxf-thumbnailer.py"
license=('GPL-2.0-or-later')
depends=('python' 'python-pillow')
source=(
  "${pkgname}.py::https://yorik.uncreated.net/archive/scripts/dxf-thumbnailer.py"
  "${pkgname}.patch"
  "dxf.thumbnailer"
)
sha256sums=(
  '6e9527b3581aa4431bd19cde29d2c8d40494191cde253bfc387e865c3f49bb8f'
  '31046005b795f832d67919940dcb03c7a7a1dd2051dee7e97e53422039f193f2'
  'fa5202bfb72406a9bdbda4efa1fe7c45ddb6aa2101fdddd400c4688e4ffba874'
)

prepare() {
  cd "$srcdir"
  # makepkg links local sources into $srcdir as symlinks; patch refuses those.
  cp -L -- "${pkgname}.py" "${pkgname}.py~"
  mv -f -- "${pkgname}.py~" "${pkgname}.py"
  patch -p0 -i "$srcdir/${pkgname}.patch"
}

package() {
  install -Dm755 "${srcdir}/${pkgname}.py" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "${srcdir}/dxf.thumbnailer" "${pkgdir}/usr/share/thumbnailers/dxf.thumbnailer"
}
