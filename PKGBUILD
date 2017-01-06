# Maintainer: M0Rf30

pkgname=kodi-addon-superrepo-all
pkgver=0.7.04
pkgrel=3
pkgdesc='The world largest XBMC addon repository containing more than 1.300 addons'
_codename=jarvis
_classname=superrepo.kodi.${_codename}.all
arch=('any')
url='http://superrepo.org/'
license=('GPL3')
depends=('kodi')
source=("http://srp.nu/${_codename}/all/${_classname}-$pkgver.zip")
noextract=("${source[@]##*/}")
optdepends=('kodi-addon-superrepo-adult: enable adult addons for XBMC')
makedepends=('unzip')

prepare() {
  cd $srcdir
  unzip -o ${_classname}-$pkgver.zip
}

package() {
  mkdir -p "$pkgdir/usr/share/kodi/addons/"
  cp -r "${srcdir}/${_classname}" "$pkgdir/usr/share/kodi/addons/"
  find "$pkgdir/usr/share/kodi/addons/${_classname}" -type d -name '.git' -exec rm -rf {} \;
  find "$pkgdir/usr/share/kodi/addons/${_classname}" -type f -exec chmod 644 {} \;
}

md5sums=('ec6672fb4c50176ccd2a9d07dd3272da')
