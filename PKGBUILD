# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

_srcname=budgie-advanced-brightness-controller

pkgname=${_srcname}-applet
pkgver=1.2.3
pkgrel=2
pkgdesc="Advanced Brightness Controller is a Budgie Desktop applet for productivity"
arch=('i686' 'x86_64')
url='https://github.com/serdarsen/budgie-advanced-brightness-controller'
license=('GPL2')
depends=('budgie-desktop' 'python' 'python-gobject' 'xorg-xrandr')

source=("${url}/archive/v${pkgver}.tar.gz"
        gsd-backlight-helper.patch)
sha256sums=('207e57c25c936430447c1c80c8591f04540d9a0ffe9812016bea1398dfbbf1f3'
            '02f477147b2ba6afcd62a0a4f5331701ff864bcaeb89f568ac77f2b5a5d567eb')

prepare() {
  cd "${srcdir}/${_srcname}-${pkgver}/src/budgie-advanced-brightness-controller"
  patch -p0 -i ../../../gsd-backlight-helper.patch
}

package() {
  _srcdir="${srcdir}/${_srcname}-${pkgver}/src/budgie-advanced-brightness-controller"
  _plugin_dir="${pkgdir}/usr/lib/budgie-desktop/plugins/budgie-advanced-brightness-controller"
  install -d "${_plugin_dir}"
  install -D -m644 "${_srcdir}/AdvancedBrightnessController.py" "${_plugin_dir}/AdvancedBrightnessController.py"
  install -D -m644 "${_srcdir}/BackLightHelper.py" "${_plugin_dir}/BackLightHelper.py"
  install -D -m644 "${_srcdir}/MyLog.py" "${_plugin_dir}/MyLog.py"
  install -D -m644 "${_srcdir}/XrandrHelper.py" "${_plugin_dir}/XrandrHelper.py"
  install -D -m644 "${_srcdir}/advancedbrightnesscontroller.plugin" "${_plugin_dir}/advancedbrightnesscontroller.plugin"

  _iconsdir="${srcdir}/${_srcname}-${pkgver}/src/icons"
  _pixmaps_dir="${pkgdir}/usr/share/pixmaps"
  install -d "${_pixmaps_dir}"
  install -D -m644 "${_iconsdir}/budgie-advanced-brightness-controller-1-symbolic.svg" "${_pixmaps_dir}/budgie-advanced-brightness-controller-1-symbolic.svg"
}
