# Maintainer: GI_Jack <iamjacksemail@hackermail.com>
# Based on PKGBUILD firefox-extension-httpseverywhere

_plugin_name=trackmenot
_plugin_version=0.9.1
pkgdesc="Firefox extension to protect web habits from tracking and profiling"
license=('cc-by-nc-sa')
pkgname=firefox-extension-$_plugin_name
pkgver=$_plugin_version
pkgrel=2
arch=('any')
url="http://cs.nyu.edu/trackmenot/"
depends=("firefox")
source=("https://addons.cdn.mozilla.net/user-media/addons/3173/trackmenot-${pkgver}-fx.xpi")
sha256sums=('97b122eb63fd293f8556cdee4319828e2f23d4f39b2fb1939f830141a95e88b3')

package() {
  cd "${srcdir}"

  _extension_id="$(sed -n '/.*<em:id>\(.*\)<\/em:id>.*/{s//\1/p;q}' install.rdf)"
  _extension_dest="${pkgdir}/usr/lib/firefox/browser/extensions/${_extension_id}"
  # Should this extension be unpacked or not?
  if grep '<em:unpack>true</em:unpack>' install.rdf > /dev/null; then
    install -dm755 "${_extension_dest}"
    cp -R ./* "${_extension_dest}"
    chmod -R ugo+rX "${_extension_dest}"
  else
    echo "marker"
    install -Dm644 ${_plugin_name}-${pkgver}-fx.xpi "${_extension_dest}.xpi"
  fi

}
