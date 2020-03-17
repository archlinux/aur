# Maintainer: Patrick josé Pereira  <gmail.com@patrickelectric>
pkgname=qhot-git
_realname=qhot
confilicts=('qhot')
pkgver=d8be17e
pkgrel=1
pkgdesc="Hot reload for nested QML files!"
arch=('i686' 'x86_64')
url="https://github.com/patrickelectric/qhot"
license=('GPL3')
buildDepends=('git')
depends=(
  'qt5-base'
  'qt5-declarative'
  'qt5-3d'
  'qt5-charts'
  'qt5-graphicaleffects'
  'qt5-imageformats'
  'qt5-location'
  'qt5-multimedia'
  'qt5-quickcontrols'
  'qt5-quickcontrols2'
  'qt5-svg'
  'qt5-tools'
  'qt5-translations'
  'qt5-webengine'
  'qt5-websockets'
  'qt5-webglplugin'
)
source=('git://github.com/patrickelectric/qhot.git')
md5sums=(SKIP)

pkgver() {
  cd $_realname
  git log --pretty=format:'%h' -n 1
}

build() {
  cd $_realname
  mkdir "build" || true
  cd "build"
  qmake ..
  make PREFIX=/usr

  	echo "[Desktop Entry]
Type=Application
Name=QHot
Comment=${pkgdesc}
Path=/opt/${pkgname}/
Exec=/usr/bin/$_realname
Terminal=true
Categories=Qt;Utility;" > "$_realname.desktop"
}

package(){
  cd $_realname
  cd "build"


  mkdir -p "${pkgdir}/opt/" "${pkgdir}/usr/bin" "${pkgdir}/usr/share/applications"
  cp $_realname "${pkgdir}/usr/bin/$_realname"
  cp "$_realname.desktop" "${pkgdir}/opt/${pkgname}"

  ln -s "/opt/${pkgname}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}
