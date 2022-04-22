# Maintainer: Nichlas Severinsen <ns@nsz.no>

pkgname=cq-editor-bin
_gitname=CQ-editor
pkgver=0.2
pkgrel=3
url="https://github.com/CadQuery/CQ-editor"
pkgdesc="CadQuery GUI editor based on PyQT"
provides=("cq-editor")
arch=("x86_64")
license=("Apache 2.0")

source=("https://github.com/CadQuery/${_gitname}/releases/download/${pkgver}/${_gitname}-Linux-${arch}.zip"
        "https://raw.githubusercontent.com/CadQuery/CQ-editor/master/icons/cadquery_logo_dark.svg"
        "cq-editor.desktop")

sha256sums=("9a39fcf938112993290c058c67b1ac92f2560fd459de2f0f94b29a74954df47c"
            "54eca787b08c860682339d28cd3795448118f29f3a7988cdcbc7e671e58cabfa"
            "867b2a5dfaa56aec9a0bdfcd53ae8b857fc4adb1ea15c48b74e351c9a1bfb8c7")

package() {
  cd $srcdir/${_gitname}

  install -d "${pkgdir}/opt/${pkgname}"

  cp -r . "${pkgdir}/opt/${pkgname}"

  rm -f "${pkgdir}/opt/${pkgname}/libstdc++.so.6"

  chmod +x "${pkgdir}/opt/${pkgname}/CQ-editor" 

  mkdir -p "${pkgdir}/usr/bin/"

  ln -s "/opt/${pkgname}/CQ-editor" "${pkgdir}/usr/bin/cq-editor"

  # icon for .desktop

  install -Dm644 "${srcdir}/cadquery_logo_dark.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/cq-editor.svg"

  # .desktop

  install -Dm644 "${srcdir}/cq-editor.desktop" "${pkgdir}/usr/share/applications/cq-editor.desktop"
  
}

