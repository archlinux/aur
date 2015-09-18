# Maintainer: Mohammadreza Abdollahzadeh <morealaz@gmail.com>

pkgname=firefox-spell-fa
pkgver=1.2
pkgrel=1
pkgdesc="Persian spellchecker dictionary for Firefox"
arch=(any)
url="https://addons.mozilla.org/firefox/dictionaries/"
license=("GPL")
depends=("firefox")
#noextract=(addon-$pkgver-an+fx+tb+fn+sm.xpi)
source=("https://addons.mozilla.org/firefox/downloads/latest/7583/addon-7583-${pkgver}.xpi"
        'http://m3g.ir/contributes/persdict.zip')
md5sums=('178499ccde299fb7689e2bf2d419b37f'
         'b6888e19ed72b18a5697091ac6d990e5')

package() {
  cd ${srcdir}
  rm ${srcdir}/*.xpi
  rm ${srcdir}/*.zip
  mv ${srcdir}/persdict.dat ${srcdir}/dictionaries/
  local _dir=${pkgdir}/usr/lib/firefox/browser/extensions/fa@dictionaries.addons.mozilla.org
  mkdir -p "${_dir}"
  cd "${_dir}"
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>44.0</em:maxVersion>#' $srcdir/install.rdf
  cp -a ${srcdir}/* "${_dir}"
  #find ${_dir} -type f -exec chmod 0644 {} \;
  touch ${_dir}/chrome.manifest
}
