# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

_plugin_name=unmht
_plugin_version=7.3.0.5
pkgdesc="view MHT (MHTML) web archive format files, and save complete web pages, including text and graphics, into a single MHT file."
license=('MPL')

pkgname=firefox-extension-${_plugin_name}
pkgver=${_plugin_version}
pkgrel=1
arch=('any')
url="https://addons.mozilla.org/firefox/addon/unmht"
depends=("firefox")
source=("${_plugin_name}-${_plugin_version}.xpi::https://addons.cdn.mozilla.net/user-media/addons/8051/${_plugin_name}-${_plugin_version}-sm+an+fx+tb.xpi")

package() {
  cd $srcdir
  emid=$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf) || return 1
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  install -d $dstdir
  rm *.xpi
  mv * $dstdir
}
sha256sums=('1ef360d4aa7f5991a49c642d9d132de6dab5807729a9207a133602454ab445aa')
