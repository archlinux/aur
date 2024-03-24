# Maintainer: Adam Thiede <me@adamthiede.com>
pkgname=buffyboard
_reponame=buffybox
pkgver=3.0.0
pkgrel=1
_lv_drivers_commit="0091dc612facc94dce1061a9b78d641c77f1791a"
_lvgl_commit="f37aebf3327a02f6a21f543d826710d56cb277f2"
pkgdesc="Touch-enabled framebuffer keyboard (not only) for vampire slayers"
arch=(x86_64 armv7h aarch64)
url="https://gitlab.com/postmarketOS/buffybox/-/tree/master/${pkgname}"
license=('GPL3')
depends=(libinput)
makedepends=(meson libinput libxkbcommon linux-headers udev)
source=(https://gitlab.com/postmarketOS/buffybox/-/archive/${pkgver}/buffybox-${pkgver}.tar.bz2
      https://github.com/lvgl/lv_drivers/archive/${_lv_drivers_commit}.tar.gz
      https://github.com/lvgl/lvgl/archive/${_lvgl_commit}.tar.gz
)

build() {
  mv "${srcdir}/lvgl-${_lvgl_commit}/"* "${srcdir}/${_reponame}-${pkgver}/lvgl"
  cd "${_reponame}-${pkgver}"
  arch-meson "${pkgname}" "${pkgname}/_build"
  meson compile -C "${pkgname}/_build"
}

package() {
  cd "${_reponame}-${pkgver}"
  DESTDIR=${pkgdir} meson install --no-rebuild -C "${pkgname}/_build"
}

sha512sums=(
ee7dfb2c785806c11ac444ed8abcbe912eb39460e97109d62b3716f7257f0cba9c0f774edff9bac49151d97d1178cc30e8773b69a00f27f57693e76773f87387
e2a487d618af5db7575fd28f1597d2f856d02b8360c57abaf89146701318cdc49f249feb893c05e98d8f400782ea5f2a8030220f16305c8365388b777da358d8
804e84063ab31258cb628155b0705af2fad33542fbce2c5a4e8cc9e906720deae1b1eee740f1e23be17192565291166be285fe5b6ab1ae92b79382149bb17535
)
