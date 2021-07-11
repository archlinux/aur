# Maintainer: Muflone http://www.muflone.com/contacts/english/

pkgname=4kvideodownloader
pkgver=4.16.4.4300
pkgrel=1
pkgdesc="Quickly download videos from YouTube in high-quality."
arch=('x86_64')
url="http://www.4kdownload.com/products/product-videodownloader"
license=('custom:eula')
depends=('qt5-script' 'qt5-declarative' 'portaudio' 'ffmpeg' 'openssl-1.0')
makedepends=('chrpath')
source=("${pkgname}_${pkgver}_amd64.tar.bz2"::"https://dl.4kdownload.com/app/${pkgname}_${pkgver%.*}_amd64.tar.bz2"
        "${pkgname}.desktop"
        "${pkgname}.png"
        "fix_symlink_path.patch")
sha256sums=('69f84158f060ff234fefd5dccfe6a0c79a1f19ff6236525520ec8e4ec14e1a54'
            '8df6a293816854216a35b53e3ec01a2dc6d8cfb416806d49fc5d83f04ecb958f'
            '56b851ef96aade0612f236b8763ccaf2def8acdd49f37bbefdd79e1d5f6e68be'
            '2b5a9c262ff7b832eafbfb0e027b676a8be44f9c527b99ac00bd8379fc709668')

prepare() {
  cd "${pkgname}"
  # Remove insecure RPATH
  chrpath --delete "${pkgname}-bin"
  # Fix symlink path
  patch -p1 -i "${srcdir}/fix_symlink_path.patch"
}

package() {
  # Install desktop file
  install -m 755 -d "${pkgdir}/usr/share/applications"
  install -m 755 -t "${pkgdir}/usr/share/applications" "${pkgname}.desktop"
  # Install icon file
  install -m 755 -d "${pkgdir}/usr/share/pixmaps"
  install -m 644 -t "${pkgdir}/usr/share/pixmaps" "${pkgname}.png"
  # Install files
  cd "${pkgname}"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "${pkgname}-bin"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/audio"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/audio" audio/*
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/translation"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/translation" translation/*
  # Temporarily ship bundled QT5 libraries as system libraries are unsupported
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "${pkgname}.sh"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Concurrent.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Core.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5DBus.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Gui.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Network.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Positioning.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5PrintSupport.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Qml.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5QmlModels.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Quick.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5QuickWidgets.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5WebChannel.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5WebEngineCore.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5WebEngineWidgets.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Widgets.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5XcbQpa.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "libQt5Xml.so.5"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}" "QtWebEngineProcess"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" "icudtl.dat"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" "qtwebengine_devtools_resources.pak"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" "qtwebengine_resources.pak"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" "qtwebengine_resources_100p.pak"
  install -m 644 -t "${pkgdir}/usr/lib/${pkgname}" "qtwebengine_resources_200p.pak"
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/platforms"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/platforms" platforms/*
  install -m 755 -d "${pkgdir}/usr/lib/${pkgname}/xcbglintegrations"
  install -m 755 -t "${pkgdir}/usr/lib/${pkgname}/xcbglintegrations" xcbglintegrations/*
  # Install launcher file
  install -m 755 -d "${pkgdir}/usr/bin"
  ln -s "/usr/lib/${pkgname}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
  # Install license file
  install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "doc/eula"
}
