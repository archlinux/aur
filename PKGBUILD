# Maintainer: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Vi0L0 <vi0l093@gmail.com>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>

pkgname=codexl-bin
pkgver=2.0.12400
pkgrel=1
pkgdesc="Comprehensive tool suite that enables developers to harness the benefits of CPUs, GPUs and APUs"
arch=('x86_64')
url="http://gpuopen.com/compute-product/codexl/"
license=('MIT')
options=('staticlibs' 'libtool' '!strip' '!upx')
depends=('libpng12' 'libgl' 'libcl' 'xorg-xhost')
source=("https://github.com/GPUOpen-Tools/CodeXL/releases/download/v${pkgver%.*}/CodeXL_Linux_${CARCH}_${pkgver}.tar.gz"
        'codexl.png'
        'codexl.desktop')
md5sums=('ee622a5d41b8115e2ab274800d812552'
         '34792207ff65c7b2314a9bd8cbeb4e1f'
         'a80e16b7378abdd3e0d6d34e485246e1')
noextract=("$(basename "${source[0]}")")

package() {
  install -dm755 "${pkgdir}/opt/CodeXL"
  pushd "${pkgdir}/opt/CodeXL" >/dev/null
    tar --strip-components=1 -xf "${srcdir}/$(basename "${source[0]}")"
  popd >/dev/null

  install -dm755 "${pkgdir}/usr/bin"
  ln -s /opt/CodeXL/CodeXL "$pkgdir/usr/bin/CodeXL"

  install -D -m755 "${srcdir}/codexl.png" "${pkgdir}/usr/share/pixmaps/codexl.png"
  install -D -m755 "${srcdir}/codexl.desktop" "${pkgdir}/usr/share/applications/codexl.desktop"
}
