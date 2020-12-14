# Maintainer: Snehit Sah <snehitsah at protonmail dot com>
pkgname=gamma-text-editor
pkgver=0.0.4
pkgrel=0
pkgdesc="A lightweight text editor, alternative to Gedit or Notepad++"
arch=(x86_64 i686)
url="https://gitlab.com/hamadmarri/gamma-text-editor"
license=("GPL3")
depends=("python3" "gtk3" "gtksourceview4" "gobject-introspection" "ctags" "yelp" "gedit-plugins")
source=(${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz)
sha256sums=("SKIP")

prepare() {
  cp "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop.bak" "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop"
  sed -i -e "s,\[gamma path placeholder\],/opt/${pkgname}/bin/gamma," "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop"
}

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  mkdir -p "${pkgdir}/opt/${pkgname}/"
  mkdir -p "${pkgdir}/usr/share/gtksourceview-4/styles/"
  install -D "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.svg" "${pkgdir}/usr/share/icons/io.gitlab.hamadmarri.gamma.svg"
  install -D "$PWD/${pkgname}-v${pkgver}/bin/io.gitlab.hamadmarri.gamma.desktop" "${pkgdir}/usr/share/applications/io.gitlab.hamadmarri.gamma.desktop"
  install -D $PWD/${pkgname}-v${pkgver}/gtksourceview_styles/* "${pkgdir}/usr/share/gtksourceview-4/styles/"
  cp $PWD/${pkgname}-v${pkgver}/* "${pkgdir}/opt/${pkgname}/" -r
  ln -s "/opt/${pkgname}/bin/gamma" ${pkgdir}/usr/bin/gamma-editor
}
