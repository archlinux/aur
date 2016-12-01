# Maintainer: ValHue <vhuelamo at gmail dot com>
# https://github.com/ValHue/AUR-PKGBUILDs
#
# Contributor: marlock <marlock87 at hotmail dot com>
#
_name="mapcatcher"
_python="python2"
pkgname="gmapcatcher"
pkgver="0.8.0.4"
pkgrel="2"
pkgdesc="GMapCatcher is an offline maps viewer"
arch=('i686' 'x86_64')
url="https://github.com/heldersepu/gmapcatcher"
license=('GPL2')
depends=('python2' 'pygtk' 'gtk2' 'python2-cairo' 'python2-gobject2')
conflicts=('gmapcatcher-svn')
provides=('gmapcatcher')
source=("${pkgname}.png"
        "https://github.com/ValHue/AUR-PKGBUILDs/raw/master/${pkgname}/${_name}_${pkgver}.tar.gz")
sha256sums=('d3421d3a2ad41f0d9de1e1aa76366a8c6a1811da80f29d1dba2b853662ee29d1'
            '9cc969e9c4fb7fe42e7afb33b5bf60a868c626e2ec957d3003daeecdaa1dae76')

_gmapcatcher_desktop="[Desktop Entry]
Name=GMapCatcher
Version=0.8.0.4
GenericName=Offline Map Viewer
Comment=Download maps, view whenever you need to, view gps
Exec=mapcatcher
Icon=gmapcatcher
Terminal=false
Type=Application
Categories=GNOME;Application;Network;Viewer;
StartupNotify=true"

build() {
    cd "${srcdir}"
    echo -e "$_gmapcatcher_desktop" | tee "${pkgname}.desktop"

    cd "${_name}-${pkgver}"
    export PYTHON="/usr/bin/${_python}"
    ${_python} setup.py build
}

package() {
    cd "${_name}-${pkgver}"
    ${_python} setup.py install --root="${pkgdir}" --optimize=1

    cd "${pkgdir}"
    rm -rf ./usr/share/doc

    # Install GMapCatcher Icon
    rm -r ./usr/share/pixmaps/mapcatcher.png
    install -m644 ${srcdir}/gmapcatcher.png ${pkgdir}/usr/share/pixmaps

    # Install desktop shortcut
    rm -r ./usr/share/applications/gmapcatcher.desktop
    install -m644 ${srcdir}/${pkgname}.desktop ${pkgdir}/usr/share/applications
}

# vim:set ts=4 sw=2 ft=sh et:
