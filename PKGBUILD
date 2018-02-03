#Maintainer: Ivan Kuraj
#Contributor: Ivan Kuraj

pkgname=scala-ide
pkgver=4.7.0
pkgrel=2
pkgdesc="Scala IDE for Eclipse, stand-alone version"
arch=('x86_64')
url="http://www.scala-ide.org/"
license=('custom')
source=(
  $pkgname-$pkgver.zip::"http://downloads.typesafe.com/scalaide-pack/$pkgver-vfinal-oxygen-212-20170929/scala-SDK-$pkgver-vfinal-2.12-linux.gtk.$CARCH.tar.gz"
	"LICENSE" "scala-ide.desktop" "product.png" "scala-ide.sh"
)
depends=("java-environment>=8" unzip)
optdepends=("webkitgtk: support for internal SWT Browser") 
provides=('scala-ide')
md5sums=('2656fa91a0a89db585390e4446cd361f'
         '58b225f304aaf42c8b8738894a10cb96'
         '6a7d702fc49dd5b6895f7161ad7f0574'
         'c95b1920928f10d2c982afd7f5827a2c'
         'f9b156600b7e150f217d5061d6d16666')

package() {
  install -D -m0644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/${pkgname}/LICENSE
  install -D -m0644 "$srcdir"/scala-ide.desktop "$pkgdir"/usr/share/applications/${pkgname}.desktop
  install -D -m0644 "$srcdir"/product.png "$pkgdir"/usr/share/pixmaps/${pkgname}.png

  install -d "$pkgdir/usr/lib"

  cd $srcdir
  cp -a eclipse "$pkgdir/usr/lib/${pkgname}"

  install -D scala-ide.sh "$pkgdir/usr/bin/scala-ide"

  #_dest="${pkgdir}"/usr/share/eclipse/dropins/${pkgname/eclipse-}/eclipse
  #cd "${srcdir}"/site

  ## Features
  #find features -type f | while read _feature ; do
  #  if [[ ${_feature} =~ (.*\.jar$) ]] ; then
  #    install -dm755 ${_dest}/${_feature%*.jar}
  #    cd ${_dest}/${_feature/.jar}
  #    jar xf ${srcdir}/site/${_feature}
  #  else
  #    install -Dm644 ${_feature} "${_dest}"/${_feature}
  #  fi
  #done

  ## Plugins
  #find plugins -type f | while read _plugin ; do
  #  install -Dm644 ${_plugin} "${_dest}"/${_plugin}
  #done
}
