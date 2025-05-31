# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgbase=wxwidgets-light
pkgname=(
  'wxwidgets-common-light'
  'wxwidgets-gtk3-light'
#   'wxwidgets-gtk4-light'
  'wxwidgets-qt5-light'
)
pkgver=3.2.8.1
pkgrel=1
pkgdesc="wxWidgets suite for Base, Qt5 and GTK3 toolkits (GNOME/GStreamer free!)"
arch=('x86_64')
url='http://wxwidgets.org'
license=('custom:wxWindows')
makedepends=(
  'git'
  'cmake'
  'glu'
  'webkit2gtk-4.1'
  'gtk3'
#  'gtk4'
  'libnotify'
  'qt5-base'
  'sdl2'
  'libmspack'
  'libsecret'
  'bash'
  'gspell'
  'gcc-libs'
  'glibc'
  'curl'
  'expat'
  'glib2'
  'xz'
  'pcre2'
  'libglvnd'
  'libtiff'
  'libjpeg-turbo'
  'libglvnd'
  'libpng'
  'fontconfig'
  'pango'
  'cairo'
  'gdk-pixbuf2'
  'wayland'
  'cython'
  'nanosvg'
  'libxkbcommon'
  'gettext'
)
source=(
  "wxwidgets::git+https://github.com/wxWidgets/wxWidgets.git#tag=v${pkgver}"
)
sha256sums=('SKIP')
options=('debug')

prepare() {
  cd wxwidgets

  git cherry-pick ed510012bac97f6ad1f3b776d1b13c37a987e83e -n # Fix undefined symbols in Qt build
  git cherry-pick 8ea22b5e92bf46add0b20059f6e39a938858ff97 -n # Avoid crash with GTK3 if console program is using a GUI wxApp
}

build() {
  msg2 "Build WxBASE"
  cmake -S wxwidgets -B build-base \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxUSE_GUI=OFF \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_LIBSDL=ON \
    -DwxUSE_PRIVATE_FONTS=ON

  cmake --build build-base

  msg2 "Build WxGTK3"
    cmake -S wxwidgets -B build-gtk3 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=gtk3 \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_LIBSDL=ON \
    -DwxUSE_MEDIACTRL=OFF \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_GTKPRINT=ON \
    -DwxUSE_DETECT_SM=ON \
    -DwxUSE_AUTOID_MANAGEMENT=ON

  cmake --build build-gtk3

#   msg2 "Build WxGTK4"
#     cmake -S wxwidgets -B build-gtk4 \
#     -DCMAKE_INSTALL_PREFIX=/usr \
#     -DCMAKE_BUILD_TYPE=None \
#     -DwxBUILD_TOOLKIT=gtk4 \
#     -DwxUSE_OPENGL=ON \
#     -DwxUSE_REGEX=sys \
#     -DwxUSE_ZLIB=sys \
#     -DwxUSE_EXPAT=sys \
#     -DwxUSE_LIBJPEG=sys \
#     -DwxUSE_LIBPNG=sys \
#     -DwxUSE_LIBTIFF=sys \
#     -DwxUSE_LIBLZMA=sys \
#     -DwxUSE_NANOSVG=sys \
#     -DwxUSE_LIBMSPACK=ON \
#     -DwxUSE_LIBSDL=ON \
#     -DwxUSE_MEDIACTRL=OFF \
#     -DwxUSE_PRIVATE_FONTS=ON \
#     -DwxUSE_GTKPRINT=ON \
#     -DwxUSE_DETECT_SM=ON \
#     -DwxUSE_AUTOID_MANAGEMENT=ON

#   cmake --build build-gtk4

  msg2 "Build WxQT5"
  cmake -S wxwidgets -B build-qt5 \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
    -DwxBUILD_TOOLKIT=qt \
    -DwxUSE_OPENGL=ON \
    -DwxUSE_REGEX=sys \
    -DwxUSE_ZLIB=sys \
    -DwxUSE_EXPAT=sys \
    -DwxUSE_LIBJPEG=sys \
    -DwxUSE_LIBPNG=sys \
    -DwxUSE_LIBTIFF=sys \
    -DwxUSE_LIBLZMA=sys \
    -DwxUSE_NANOSVG=sys \
    -DwxUSE_LIBMSPACK=ON \
    -DwxUSE_LIBSDL=ON \
    -DwxUSE_MEDIACTRL=OFF \
    -DwxUSE_PRIVATE_FONTS=ON \
    -DwxUSE_DETECT_SM=ON \
    -DwxUSE_AUTOID_MANAGEMENT=ON

  cmake --build build-qt5
}

package_wxwidgets-qt5-light() {
pkgdesc="wxWidgets Qt5 Toolkit (GNOME/GStreamer free!)"
  depends=(
    'bash'
    'glibc'
    'libpng'
    'qt5-base'
    'sdl2'
    'gcc-libs'
    'wxwidgets-common-light' 'libwx_baseu-3.2.so' 'libwx_baseu_xml-3.2.so'
    'libglvnd' 'libOpenGL.so'
    'libjpeg-turbo' 'libjpeg.so'
    'libmspack' 'libmspack.so'
    'libtiff' 'libtiff.so'
  )
  provides=(
    'wxwidgets'
    "wxwidgets-qt5=${pkgver:0:3}"
    'libwx_qtu_adv-3.2.so'
    'libwx_qtu_aui-3.2.so'
    'libwx_qtu_core-3.2.so'
    'libwx_qtu_gl-3.2.so'
    'libwx_qtu_html-3.2.so'
    'libwx_qtu_propgrid-3.2.so'
    'libwx_qtu_qa-3.2.so'
    'libwx_qtu_ribbon-3.2.so'
    'libwx_qtu_richtext-3.2.so'
    'libwx_qtu_stc-3.2.so'
    'libwx_qtu_xrc-3.2.so'
  )
  conflicts=('wxwidgets-qt5')

  DESTDIR="${pkgdir}" cmake --install build-qt5

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-qt"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3*}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*base*
  mv "${pkgdir}/usr/lib/cmake/wxWidgets"{,Qt}
  for _f in "${pkgdir}/usr/lib/cmake/wxWidgetsQt/"*; do
    mv $_f $(dirname $_f)/$(basename $_f | sed -e 's/wxWidgets/wxWidgetsQt/')
  done
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wxwidgets-gtk3-light() {
  pkgdesc="wxWidgets GTK3 Toolkit (GNOME/GStreamer free!)"
  depends=(
    'libsm'
    'bash'
    'gcc-libs'
    'libpng'
    'glibc'
    'libx11'
    'libxtst'
    'sdl2'
    'wxwidgets-common-light' 'libwx_baseu-3.2.so' 'libwx_baseu_xml-3.2.so'
    'libglvnd' 'libEGL.so' 'libOpenGL.so'
    'cairo'  'libcairo.so'
    'fontconfig'  'libfontconfig.so'
    'gtk3' 'libgdk-3.so' 'libgtk-3.so'
    'gdk-pixbuf2' 'libgdk_pixbuf-2.0.so'
    'glib2' 'libgio-2.0.so' 'libglib-2.0.so' 'libgobject-2.0.so'
    'gspell' 'libgspell-1.so'
    'libjpeg-turbo' 'libjpeg.so'
    'libmspack' 'libmspack.so'
    'libnotify' 'libnotify.so'
    'pango' 'libpango-1.0.so' 'libpangocairo-1.0.so' 'libpangoft2-1.0.so'
    'libtiff' 'libtiff.so'
    'wayland' 'libwayland-client.so' 'libwayland-egl.so'
    'libxkbcommon' 'libxkbcommon.so'
  )
  provides=(
    'wxwidgets'
    "wxwidgets-gtk3=${pkgver:0:3}"
    'libwx_gtk3u_adv-3.2.so'
    'libwx_gtk3u_aui-3.2.so'
    'libwx_gtk3u_core-3.2.so'
    'libwx_gtk3u_gl-3.2.so'
    'libwx_gtk3u_html-3.2.so'
    'libwx_gtk3u_propgrid-3.2.so'
    'libwx_gtk3u_qa-3.2.so'
    'libwx_gtk3u_ribbon-3.2.so'
    'libwx_gtk3u_richtext-3.2.so'
    'libwx_gtk3u_stc-3.2.so'
    'libwx_gtk3u_webview-3.2.so'
    'libwx_gtk3u_xrc-3.2.so'
  )
  optdepends=('webkit2gtk-4.1: for webview support')
  conflicts=('wxwidgets-gtk3')

  DESTDIR="${pkgdir}" cmake --install build-gtk3

  ln -s wx-config "${pkgdir}/usr/bin/wx-config-gtk3"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-3*}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*base*
  mv "${pkgdir}/usr/lib/cmake/wxWidgets"{,GTK}
  for _f in "${pkgdir}/usr/lib/cmake/wxWidgetsGTK/"*; do
    mv $_f $(dirname $_f)/$(basename $_f | sed -e 's/wxWidgets/wxWidgetsGTK/')
  done
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wxwidgets-gtk4-light() {
  pkgdesc="wxWidgets GTK4 Toolkit (GNOME/GStreamer free!)"
  depends=(
    'sdl2'
    'wxwidgets-common-light' 'libwx_baseu-3.2.so' 'libwx_baseu_xml-3.2.so'
    'gspell' 'libgspell-1.so'
    'gtk4' 'libgtk-4.so'
    'libmspack' 'libmspack.so'
    'libnotify' 'libnotify.so'
    'libtiff'  'libtiff.so'
)
  optdepends=('webkit2gtk-4.1: for webview support')
  provides=(
    'wxwidgets'
    "wxwidgets-gtk4=${pkgver:0:3}"
  )
  conflicts=('wxwidgets-gtk4')

  DESTDIR="${pkgdir}" cmake --install build-gtk4

  ln -s wx-config "${pkgdir}/usr/bin/wx-config-gtk4"
  rm -fr "${pkgdir}/usr/bin/"wxrc{,-4*}
  rm -fr "${pkgdir}/usr/include"
  rm -fr "${pkgdir}/usr/lib/"*base*
  mv "${pkgdir}/usr/lib/cmake/wxWidgets"{,GTK4}
  for _f in "${pkgdir}/usr/lib/cmake/wxWidgetsGTK4/"*; do
    mv $_f $(dirname $_f)/$(basename $_f | sed -e 's/wxWidgets/wxWidgetsGTK4/')
  done
  rm -fr "${pkgdir}/usr/share/bakefile"
  rm -fr "${pkgdir}/usr/share/"{aclocal,locale}

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_wxwidgets-common-light() {
  pkgdesc="wxWidgets common & base (GNOME/GStreamer free!)"
  depends=(
    'gcc-libs'
    'glibc'
    'bash'
    'zlib'
    'xz'
    'curl' 'libcurl.so'
    'expat' 'libexpat.so'
    'glib2' 'libglib-2.0.so' 'libgobject-2.0.so'
    'xz' 'liblzma.so'
    'pcre2' 'libpcre2-32.so'
    'libsecret' 'libsecret-1.so'
  )
  provides=(
    'wxbase'
    'wxbase-light'
    "wxwidgets-common=${pkgver:0:3}"
    'libwx_baseu-3.2.so'
    'libwx_baseu_net-3.2.so'
    'libwx_baseu_xml-3.2.so'
  )
  conflicts=(
    'wxbase'
    'wxwidgets-common'
  )

  DESTDIR="${pkgdir}" cmake --install build-qt5
  DESTDIR="${pkgdir}" cmake --install build-gtk3
#   DESTDIR="${pkgdir}" cmake --install build-gtk4
  DESTDIR="${pkgdir}" cmake --install build-base

  mv "${pkgdir}/usr/bin/wx-config" "${pkgdir}/usr/bin/wx-config-base"
  rm -fr "${pkgdir}/usr/lib/"*qt*.so*
  rm -fr "${pkgdir}/usr/lib/"*gtk*.so*
  rm -fr "${pkgdir}/usr/lib/wx/"{config,include}/{gtk,qt}*
  rm -fr "${pkgdir}/usr/lib/wx/"3*

  install -Dm644 wxwidgets/wxwin.m4 -t "${pkgdir}/usr/share/aclocal"

  install -Dm644 wxwidgets/docs/licence.txt "${pkgdir}/usr/share/licenses/wxwidgets-common-light/LICENSE"
}
