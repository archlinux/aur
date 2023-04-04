# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Maintainer: fkxxyz <fkxxyz@163.com>
_pkgname=youdao-dict
pkgname="${_pkgname}-bin"
pkgver=6.0.0
pkgrel=1
pkgdesc="YouDao Dictionary"
arch=('x86_64')
license=('GPL3')
conflicts=("${_pkgname}")
url="http://cidian.youdao.com/"
depends=('sqlite' 'python-lxml' 'python-webob' 'glib2' 'python-opengl' 'python-gobject' 'hicolor-icon-theme' 'python-xlib' 'python-pillow' \
    'python>=3' 'python-requests' 'gstreamer' 'python-pyquery' 'python-pyqt5-webkit' 'gobject-introspection-runtime' 'python-cssselect' \
    'glibc' 'gstreamer0.10' 'python-pyxdg')
source=("${_pkgname}-${pkgver}.deb::http://codown.youdao.com/cidian/linux/${_pkgname}_${pkgver}-0-deepin_amd64.deb")
sha256sums=('7e2ac620b1be2774192f8cacee4cdbdd2820d979061fcc733b1654c811e8fb15')
package(){
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm755 -d "${pkgdir}/opt/${_pkgname}"
    mv "${pkgdir}/usr/share/${_pkgname}" "${pkgdir}/opt/"
    sed -i '290s/self.setX(x)/self.setX(int(x))/g' "${pkgdir}/opt/${_pkgname}/app/plugins/youdao/window.py"
    sed -i '291s/self.setY(y)/self.setY(int(y))/g' "${pkgdir}/opt/${_pkgname}/app/plugins/youdao/window.py"
    sed -i '644s/self.move(x, y)/self.move(int(x), int(y))/g' "${pkgdir}/opt/${_pkgname}/dae/window.py"
    sed 's/usr\/share/opt/g' -i "${pkgdir}/usr/share/dbus-1/services/com.youdao.backend.service"
    rm -rf "${pkgdir}/usr/bin/youdao-dict"
    ln -sf "${pkgdir}/opt/${_pkgname}/main.py" "${pkgdir}/usr/bin/youdao-dict"
}