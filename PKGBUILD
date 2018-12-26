pkgname=kazam
pkgver=1.4.5
pkgrel=7
pkgdesc="A screencasting program with design in mind"
arch=('any')
url="https://launchpad.net/kazam"
license=('GPL')
groups=()
depends=('python' 'python-cairo' 'python-xdg' 'python-dbus' 'python-distutils-extra' 'python-gobject' 'gobject-introspection' 'gstreamer' 'gst-plugins-base' 'gtk3' 'pango' 'gdk-pixbuf2' 'libwnck3' 'ffmpeg' 'libmatroska' 'libtheora' 'gnome-desktop')
optdepends=('libkeybinder3: hotkeys support' 'libappindicator3: indicator on Unity panel support')
conflicts=('kazam-bzr' 'kazam-stable-bzr')
source=("https://launchpad.net/${pkgname}/stable/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz"
    'version.patch'
    'configparser_api_changes.patch'
    'configparser34.py'
    'configparser_use_old_version.patch')
md5sums=('522ac80fef7123875271b30298ed6877'
         '847ae2478ae5e35f6e1af49aa9fb3fa9'
         '8e751e821558c989ac02ef687a7b7339'
         '9974105c95473b9d39c705780367879a'
         '4e59fc27cd4cd5ca1fe1aa379009c31e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cp "${srcdir}/configparser34.py" "${srcdir}/$pkgname-$pkgver/$pkgname/backend/"
    patch -p1 < "${srcdir}/version.patch"
    patch -p1 < "${srcdir}/configparser_api_changes.patch"
    patch -p1 < "${srcdir}/configparser_use_old_version.patch"
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    python3 setup.py install --root ${pkgdir}
}
