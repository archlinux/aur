# Maintainer: marcs <marcs.pompili@gmail.com>
# Maintainer: onny <onny@project-insanity.org>
# Contributor: onny <onny@project-insanity.org>
# Contributor: Jamar <jamar@jamar.org>

pkgname=oclhashcat-nvidia
_pkgname=cudaHashcat
pkgver=1.36
pkgrel=1
pkgdesc="Worlds fastest password cracker with dictionary mutation engine"
url=('http://hashcat.net/oclhashcat/')
arch=('i686' 'x86_64')
license=('custom')
optdepends=('nvidia-utils>=346: For for gpu support via Nvidia CUDA')
source=("http://hashcat.net/files/${_pkgname}-${pkgver}.7z")
sha512sums=('28ed89d22698978ce3f84120019699cca4afe6a7e5264de06a3d3b12f451e41539a0a93f58ce3279cffcd5c67e6029c27a70b3db9eb80dbc0aed25c4f8372f59')
options=('!strip')

package() {
  find "${srcdir}/${_pkgname}-${pkgver}" \( -name "*.cmd" -o -name "*.exe" \) -print | xargs -i rm {}
  mkdir -p "${pkgdir}/opt" "${pkgdir}/usr/bin"
  if [ "${CARCH}" = "x86_64" ]; then
    rm ${srcdir}/${_pkgname}-${pkgver}/cudaHashcat32.bin
    echo -e "#!/bin/bash\n/opt/${pkgname}/cudaHashcat64.bin \$@" > $pkgdir/usr/bin/cudaHashcat
    chmod a+x $pkgdir/usr/bin/cudaHashcat
  else
    rm ${srcdir}/${_pkgname}-${pkgver}/cudaHashcat64.bin
    echo -e "#!/bin/bash\n/opt/${pkgname}/cudaHashcat32.bin \$@" > $pkgdir/usr/bin/cudaHashcat
    chmod a+x $pkgdir/usr/bin/cudaHashcat
  fi
  cp -rv "${srcdir}/${_pkgname}-${pkgver}" "${pkgdir}/opt/${pkgname}"
}
