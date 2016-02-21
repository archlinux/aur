# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>

pkgname=gfxbench
pkgver=4.0.0
pkgrel=2
pkgdesc="Unified graphics benchmark based on DXBenchmark (DirectX) and GLBenchmark (OpenGL ES)"
url='https://gfxbench.com/'
arch=('i686' 'x86_64')
license=('custom')
depends=('libpng12')
_basename="gfxbench_gl-linux-qt-${pkgver}+community"
source_i686=(  "${_basename}.sh::http://gfxbench.com/download/${_basename}_32bit.sh")
source_x86_64=("${_basename}.sh::http://gfxbench.com/download/${_basename}_64bit.sh")
md5sums_i686=(  '9eccb959962efda21f94d5bb301ece5c')
md5sums_x86_64=('9ec770568944857158b05238b8593405')

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
