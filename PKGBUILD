# Maintainer: zxp19821005 <zxp19821005 at 163 dot com>
# Contributor: fkxxyz <fkxxyz@163.com>
pkgname="youdao-dict-bin"
pkgver=6.0.0
pkgrel=2
pkgdesc="YouDao Dictionary"
arch=('x86_64')
license=('GPL3')
conflicts=("${pkgname%-bin}")
url="http://cidian.youdao.com/"
depends=('sqlite' 'python-lxml' 'python-webob' 'glib2' 'python-opengl' 'python-gobject' 'hicolor-icon-theme' 'python-xlib' 'python-pillow' \
    'python>=3' 'python-requests' 'gstreamer' 'python-pyquery' 'python-pyqt5-webkit' 'gobject-introspection-runtime' 'python-cssselect' \
    'glibc' 'gstreamer0.10' 'python-pyxdg')
source=("${pkgname%-bin}-${pkgver}.deb::http://codown.youdao.com/cidian/linux/${pkgname%-bin}_${pkgver}-0-deepin_amd64.deb")
sha256sums=('7e2ac620b1be2774192f8cacee4cdbdd2820d979061fcc733b1654c811e8fb15')
package(){
    bsdtar -xf data.tar.xz -C "${pkgdir}"
    install -Dm755 -d "${pkgdir}/opt/${pkgname%-bin}"
    mv "${pkgdir}/usr/share/${pkgname%-bin}" "${pkgdir}/opt/"
    sed -i '290s|self.setX(x)|self.setX(int(x))|g;291s|self.setY(y)|self.setY(int(y))|g' "${pkgdir}/opt/${pkgname%-bin}/app/plugins/youdao/window.py"
    sed -i '644s|self.move(x, y)|self.move(int(x), int(y))|g' "${pkgdir}/opt/${pkgname%-bin}/dae/window.py"
    sed 's|usr/share|opt|g' -i "${pkgdir}/usr/share/dbus-1/services/com.youdao.backend.service"
    rm -rf "${pkgdir}/usr/bin/${pkgname%-bin}"
    ln -sf "${pkgdir}/opt/${pkgname%-bin}/main.py" "${pkgdir}/usr/bin/${pkgname%-bin}"
}