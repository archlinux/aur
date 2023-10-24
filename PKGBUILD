# Maintainer: Mike Swanson <mikeonthecomputer@gmail.com>

pkgname=obs-plugin-time-source
pkgver=0.1
pkgrel=1
pkgdesc="Shows date and time in OBS as a source"
arch=('x86_64')
url="https://git.sr.ht/~krystianch/obs-time-source"
license=('GPL3')
depends=('obs-studio')
makedepends=('meson' 'ninja')
source=("${url}/archive/v${pkgver}.tar.gz"
        0001-Add-installation-of-locale-files.patch
        0002-add-pt-BR-translation.patch)
b2sums=('8dc59e22c93e8aabd907b4bb2e94b8f09e8e6a4c56ed26698c767868a34394d5955cb0100248fd18ec402a7409d13a29e6d9de463f159f756faf1b95ba1536d6'
        'f11e5fc225290a1db79a4295c2ebce83b868f43f435f5f2d904f81171bfdb0839080bd0ef0942c29c7db69d621ec6f3fd6ef602b638b2f9f4796910b1edecce7'
        'f3c38c6be272b233743cea39e47a7aeeb7f63bc73ee4aca1dcd688ba0f6eef359b696a1462587fc7279e9333694111611c2efc7e23a22469c39f0c5f779776e6')

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
