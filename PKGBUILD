# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gfxbench
pkgver=4.0.13
pkgrel=2
pkgdesc="Unified graphics benchmark based on DXBenchmark (DirectX) and GLBenchmark (OpenGL ES)"
url='https://gfxbench.com/'
arch=('i686' 'x86_64')
license=('custom')
depends=('libpng12')
_basename="gfxbench_gl-linux-qt-${pkgver}+community"
source_i686=(  "${_basename}.sh::https://gfxbench.com/download/${_basename}_32bit.sh")
source_x86_64=("${_basename}.sh::https://gfxbench.com/download/${_basename}_64bit.sh")
sha1sums_i686=(  'dfbcd1deeeb3a21cd79738c30d535f08ebfdac6c')
sha1sums_x86_64=('9480bd67d7a5873d0f732c5d22b10f25c8fdf891')

package() {
  cd "${srcdir}"

  install -dm755 "${pkgdir}"/opt/"${pkgname}"
  sh "${_basename}".sh \
    --skip-license \
    --prefix="${pkgdir}"/opt/"${pkgname}"

  install -dm755 "${pkgdir}"/usr/bin
  ln -s /opt/"${pkgname}"/gfxbench_gl "${pkgdir}"/usr/bin/"${pkgname}"

  install -dm755 "${pkgdir}"/usr/share/licenses/"${pkgname}"
  ln -s /opt/"${pkgname}"/copyright "${pkgdir}"/usr/share/licenses/"${pkgname}"

  # Fix path
  sed -i "s#${pkgdir}##" "${pkgdir}"/opt/"${pkgname}"/gfxbench_gl.desktop
}
