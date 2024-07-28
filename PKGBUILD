# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=obs-plugin-time-source
pkgver=0.2
pkgrel=1
pkgdesc="Shows date and time in OBS as a source"
arch=('x86_64')
url="https://git.sr.ht/~krystianch/obs-time-source"
license=('GPL3')
depends=('obs-studio')
makedepends=('meson' 'ninja')
source=("${url}/archive/v${pkgver}.tar.gz")
b2sums=('2efbf1162aef83e2cc515694d94198f41eaf64b1093af7af79374b4ee6d9dd08ccfe13cd4677d24e554745e5db6bb72791823ecd5460fbcdf14c852eb0c4b5dc')

prepare() {
  cd "${srcdir}/obs-time-source-v${pkgver}"

  for patch in ../*.patch; do
    if [ ! -f "$patch" ]; then
      break;
    else
      patch -p1 -i "$patch"
    fi
  done

  meson setup --prefix=/usr --buildtype=plain build
}

build() {
  cd "${srcdir}/obs-time-source-v${pkgver}/build"

  ninja
}

package() {
  cd "${srcdir}/obs-time-source-v${pkgver}/build"

  meson install --destdir "${pkgdir}"
}
