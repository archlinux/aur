# Maintainer: Cogumelo cogumelo@tutamail.com
pkgname=imageviewer
pkgver=1.8.1
pkgrel=1
license=('GPL-3.0')
arch=('x86_64')
pkgdesc="Simple, cross-platform image viewer"
url="https://github.com/AlienCowEatCake/ImageViewer"
depends=('openexr' 'qt6-base' 'qt6-svg' 'qt6-imageformats' 'libexif' 'libavif' 'libheif' 'jxrlib' 'librsvg' 'giflib' 'zlib' 'lcms2' 'exiv2' 'libjpeg-turbo' 'libmng' 'libpng' 'jbigkit' 'libtiff' 'libwebp' 'libwmf' 'openjpeg2' 'libraw' 'libjxl')
makedepends=('git' 'gcc' 'make')
optdepends=('kimageformats' 'qt6-imageformats')
provides=("$pkgname=$pkgver")
conflicts=("$pkgname")
source=(ImageViewer-$pkgver.tar.gz::https://github.com/AlienCowEatCake/ImageViewer/releases/download/v$pkgver/ImageViewer-$pkgver.tar.xz)
sha256sums=('38d99d1ecfed479b1815d30437ece03f03df54a4a59c9285daa5a768484fcc49')

prepare() {
  cp ImageViewer-$pkgver/src/ImageViewer/resources/icon/drawing.svg ImageViewer.svg
  rm -r ImageViewer-$pkgver/src/ImageViewer/resources/icon
  echo "[Desktop Entry]
Name=ImageViewer
Categories=Qt;Graphics
Comment=Simple, cross-platform image viewer
Exec=ImageViewer %U
Icon=ImageViewer
Terminal=false
MimeType=image/avif;image/svg+xml;image/svg+xml-compressed;image/vnd.microsoft.icon;image/bmp;image/gif;image/heic;image/heif;image/jpeg;image/jxl;image/png;image/tiff;image/webp;image/x-eps;image/x-ico;image/x-portable-bitmap;image/x-portable-graymap;image/x-portable-pixmap;image/x-xbitmap;image/x-xpixmap;
Type=Application" > com.github.aliencoweatcake.imageviewer.desktop
echo '<?xml version="1.0" encoding="UTF-8"?>
<component type="desktop">
    <id>com.github.aliencoweatcake.imageviewer.desktop</id>
    <name>Image Viewer</name>
    <summary>Simple, cross-platform image viewer</summary>
    <description>
        <p>Image Viewer is a open-source and cross-platform image viewer inspired by GPicView.</p>
    </description>
    <metadata_license>CC0-1.0</metadata_license>
    <project_license>GPL-3.0</project_license>
    <developer_name>AlienCowEatCake</developer_name>
    <launchable type="desktop-id">com.github.aliencoweatcake.imageviewer.desktop</launchable>
    <content_rating type="oars-1.1" />
    <screenshots>
        <screenshot type="default">
            <image>https://github.com/AlienCowEatCake/ImageViewer/raw/master/img/Ubuntu.png</image>
            <caption>Main window</caption>
        </screenshot>
    </screenshots>
    <url type="homepage">https://github.com/AlienCowEatCake/ImageViewer</url>
    <url type="bugtracker">https://github.https://github.com/AlienCowEatCake/ImageViewer/issues</url>
</component>
' > com.github.aliencoweatcake.imageviewer.xml
}

build() {
  qmake6 CONFIG+="release system_thirdparty" CONFIG+="disable_libjasper disable_libbpg disable_flif disable_lerc" \
  INCLUDEPATH+="/usr/include/jxrlib" -r $srcdir/ImageViewer-$pkgver/ImageViewer.pro
  make
}

package() {
  install -Dm 755 $srcdir/src/ImageViewer/ImageViewer $pkgdir/usr/bin/ImageViewer
  install -Dm 755 ImageViewer.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/ImageViewer.svg
  install -Dm 755 com.github.aliencoweatcake.imageviewer.desktop $pkgdir/usr/share/applications/com.github.aliencoweatcake.imageviewer.desktop
  install -Dm 755 com.github.aliencoweatcake.imageviewer.xml $pkgdir/usr/share/metainfo/com.github.aliencoweatcake.imageviewer.xml
}
