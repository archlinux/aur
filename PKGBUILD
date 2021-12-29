# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>

pkgname=redpanda-cpp-bin
pkgver=0.12.5
pkgrel=1
pkgdesc="A light-weight C/C++ IDE based on Qt"
arch=('x86_64')
url="https://github.com/royqh1979/RedPanda-CPP"
license=('GPL')
options=('!strip')
depends=('fontconfig' 'libglvnd' 'libxkbcommon-x11' 'xcb-util-image' 'xcb-util-keysyms' 'xcb-util-renderutil'
         'xcb-util-wm')
optdepends=('gcc' 'gdb' 'make' 'astyle')
provides=('redpanda-cpp')
conflicts=('redpanda-cpp')
source=(
  "${url}/releases/download/${pkgver}.linux/redpanda-${pkgver}.linux.tgz"
  "redpanda-cpp-${pkgver}.svg"::"${url}/raw/${pkgver}.linux/RedPandaIDE/images/devcpp.svg"
  redpanda-cpp.desktop
)
sha256sums=(
  'f1d783707ea401f03e6257fe6a2dfbf943898ae1c17ad0e800c9e327144992e3'
  '290eaff410fa749c874e094cd93208760c5e4aadb107c35bcb542660a2b2db05'
  '92c7e9b8f2ca9c7a6d3929da82c6dfc3bd175d1332db63f0d5002595f26bfcbd'
)

package() {
  cd "${srcdir}/RedPanda-IDE"
  install -d "${pkgdir}/usr/bin"

  install -D -m755 consolepauser "${pkgdir}/usr/lib/redpanda-cpp/consolepauser"
  install -D -m755 RedPandaIDE "${pkgdir}/usr/lib/redpanda-cpp/RedPandaIDE"
  install -D -m644 README.md "${pkgdir}/usr/share/doc/readpanda-cpp/README.md"
  install -D -m644 NEWS.md "${pkgdir}/usr/share/doc/readpanda-cpp/NEWS.md"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/readpanda-cpp/LICENSE"

  ln -s /usr/lib/redpanda-cpp/RedPandaIDE "${pkgdir}/usr/bin/redpanda-cpp"

  cd "${srcdir}/RedPanda-IDE/templates"
  for _tpl in *; do
    install -D -m644 ${_tpl} "${pkgdir}/usr/lib/redpanda-cpp/templates/${_tpl}"
  done

  cd "${srcdir}"
  install -D -m644 "redpanda-cpp-${pkgver}.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/redpanda-cpp.svg"
  install -D -m644 redpanda-cpp.desktop "${pkgdir}/usr/share/applications/redpanda-cpp.desktop"
}
