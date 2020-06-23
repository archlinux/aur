# Maintainer: Tércio Martins <echo dGVyY2lvd2VuZGVsQGdtYWlsLmNvbQo= | base64 -d>
# Contributor: Hugo Courtial <hugo [at] courtial [not colon] me>
# Contributor: Luca Weiss <luca (at) z3ntu (dot) xyz>

pkgname=openfx-misc
pkgver=2.3.15
_pkgname="${pkgname}-Natron-${pkgver}"
pkgrel=2
arch=('i686' 'pentium4' 'x86_64')
pkgdesc="Miscellaneous OpenFX plugins"
url="https://github.com/NatronGitHub/openfx-misc"
license=('GPL')
depends=('libgl')
makedepends=('openmp')
optdepends=('natron-plugins-git: More presets for the Shadertoy plugin')
source=("${_pkgname}.tar.xz::${url}/releases/download/Natron-${pkgver}/${_pkgname}.tar.xz"
        "openfx-misc-2.3.15-DenoiseSharpen.patch")
sha512sums=('614b12da180ceb4df2ea3a309b434d52eaa4ea6d2bf79ababb00b4b53c637b21c5b96f88ea7e74a2f05a0ef6df4ec1d32484f2c83ee390a193638379c5b868bf'
            'e95ee15c7a7215b99d2ab57b8a2b04ff1f504df6993f195a142b4623287ab999c00a9cc767718eb64a072ac4bef16eef1b4646884e9321d3ae652669e9a823cc')

prepare() {
    cd "${srcdir}/${_pkgname}"
    patch --forward --strip=1 --input="${srcdir}/openfx-misc-2.3.15-DenoiseSharpen.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make CONFIG=release \
       OPENMP=1
}

package() {
  cd "${srcdir}/${_pkgname}"
  mkdir -p "${pkgdir}/usr/OFX/Plugins"
  make install PLUGINPATH="${pkgdir}/usr/OFX/Plugins" \
               CONFIG=release
}
