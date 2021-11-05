# Maintainer: Mikhail K. <u@xaked.com>

pkgname="dynamic-wallpaper-macos-catalina-kde"
_gitname="dynamic-wallpaper-macos-catalina-kde"
pkgver=1.0.0
pkgrel=1
pkgdesc="MacOS Catalina dynamic dekstop wallpaper for kde."
arch=("any")
depdends=('plasma5-wallpapers-dynamic')
makedepends=('git')
url="https://github.com/mikkra/${_gitname}"
license=("GPL3")
source=("https://github.com/mikkra/${_gitname}/archive/refs/tags/v${pkgver}.tar.gz")
sha1sums=("f95b011fe2bababd311c9a3925f97a69bef31d5e")

pkgver() {
  echo $pkgver;
}

build() {
  builddir="${srcdir}/${_gitname}-${pkgver}";
  rm -rf "${builddir}/src/*.heic";
  cd "${builddir}/src" || exit;
  kdynamicwallpaperbuilder metadata.json;
  mv wallpaper.heic ${_gitname}.heic;
  cd "${builddir}" || exit;
  mv "${builddir}/src/${_gitname}.heic" "${builddir}/MacOS-Catalina/contents/images/";
}

package() {
  builddir="${srcdir}/${_gitname}-${pkgver}";
  mkdir -p "${pkgdir}/usr/share/wallpapers/";
  rm -rf "${pkgdir}/usr/share/wallpapers/MacOS-Catalina";
  cp -r "${builddir}/MacOS-Catalina" "${pkgdir}/usr/share/wallpapers/";
}
