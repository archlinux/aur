# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="huhnitor"
pkgname="${_pkgname}-snap"
pkgver=2.0.0
pkgrel=2
pkgdesc="An intergalactic serial monitor for the ESP8266 Deauther v3"
arch=('x86_64' 'aarch64' 'armv7h' 'i686' 'powerpc64le' 's390x')
url="https://github.com/SpacehuhnTech/Huhnitor"
license=('MIT')
depends=('gcc-libs' 'glibc' 'systemd-libs')
makedepends=('squashfs-tools')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/refs/tags/${pkgver}/README.md"
        "LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver}/LICENSE")
# https://askubuntu.com/a/1196449
source_x86_64=("${_pkgsrc}-x86_64.snap::https://api.snapcraft.io/api/v1/snaps/download/jiFFKkw7QQFwLpd8dtaj3louID3Du9aX_178.snap")
source_aarch64=("${_pkgsrc}-aarch64.snap::https://api.snapcraft.io/api/v1/snaps/download/jiFFKkw7QQFwLpd8dtaj3louID3Du9aX_182.snap")
source_armv7h=("${_pkgsrc}-armv7h.snap::https://api.snapcraft.io/api/v1/snaps/download/jiFFKkw7QQFwLpd8dtaj3louID3Du9aX_183.snap")
source_i686=("${_pkgsrc}-i686.snap::https://api.snapcraft.io/api/v1/snaps/download/jiFFKkw7QQFwLpd8dtaj3louID3Du9aX_179.snap")
source_powerpc64le=("${_pkgsrc}-powerpc64le.snap::https://api.snapcraft.io/api/v1/snaps/download/jiFFKkw7QQFwLpd8dtaj3louID3Du9aX_180.snap")
source_s390x=("${_pkgsrc}-s390x.snap::https://api.snapcraft.io/api/v1/snaps/download/jiFFKkw7QQFwLpd8dtaj3louID3Du9aX_181.snap")
b2sums=('b9df43264959613f6f2421491f33d0705ef39e1369e15461c01b39da453df08f778da37ab058e0d0d303f739536c3967edfc2255236e5ed6e325e457badf5aaa'
        'ba4ce8bc38d8c821e0a4419456b905e2a810ad470070c76718605b20ff7d3c3ef261562d4d1a9eac4f1b139a6ae670752de5707860704fdfd4b6d4d9658e3120')
b2sums_x86_64=('6bd5982bdfbc17c43a0b3c4cc88a7b36f727ae4993af1c63bb293db34156279b3421c8110acc3e50fd19f738d014524cad9dbb222bdbed81e6440076ae3b4f59')
b2sums_aarch64=('50c12681d4c2d4767a4e207c038ea3639ef450d99198936d58b34f44f90834eaf59615fbeda1e523fd76c0108af925943e462e33a882c1348b201d002cd75f13')
b2sums_armv7h=('48d587b357658567f69f52414ee9e41111e3485f618adf3782f0e433ac05cdaf33586012958e71a5fd178eb9ba5655b5c57ec816c98663e6dfdb3e71412c24ae')
b2sums_i686=('be144156e9675a234fed9f54adc193812997dacc7c0d0791cfcddd2d54bc6654c1456f8fa1a8271a72f3b521fdb85b9064a275bdc8930e5560279794e75f4a1b')
b2sums_powerpc64le=('4df0405f6b6237e0898ac98cea862a944c0ffe210ff2a488478fb52c5dd93a22bfea23ac3879302956ded599b2c03d42ebdff707e680650db285407674746094')
b2sums_s390x=('bb9733122823800ecf5cf969e8ac9e925ae7dd32905fd0574990ad735734451adab5349e3e8d38e6cf9f143ebf5c1884680b3a10d512a1144cf9b4a420e59ab9')

prepare() {
  cd "${srcdir}"
  unsquashfs -f -d "${srcdir}/${_pkgsrc}-${CARCH}" "${_pkgsrc}-${CARCH}.snap"
}

package() {
  cd "${srcdir}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE-${pkgver}"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  
  cd "${_pkgsrc}-${CARCH}/bin"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
}
