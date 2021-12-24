# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: notjustbill
# Contributor: untitled
# Contributor: mh00h
# Contributor: Frank Phillips <frankalso[at]gmail[dot]com>
# Contributor: Mr.Elendig
# Contributor: Internauta

set -u
pkgname='iscan-plugin-gt-x830'
pkgver='1.0.1'
_bundlever='2.30.4'
pkgrel='2'
pkgdesc='iscan plugin for Epson GT-X830 Scanner'
arch=('x86_64')
url='http://download.ebz.epson.net/dsc/search/01/search/?OSC=LX'
license=('custom')
depends=('iscan>=2.21')
install='gt-x830.install'
source=("https://download2.ebz.epson.net/iscan/plugin/gt-x830/rpm/x64/iscan-gt-x830-bundle-${_bundlever}.x64.rpm.tar.gz")
md5sums=('6b827f5484e066d2302f540dbcac591d')
sha256sums=('3d792c25db38d6cac50fe9026f64fb89a8a20f512d4b6d555b20c64623ee5e52')
# md5sums=('f0b466d04e05018af6942e82a571e1f5')
# sha256sums=('63647dac68e26bfee5bd75108cc6a4df0fddb8453a1e3bac2d63dea7db518bee')

prepare() {
  set -u
  cd "iscan-gt-x830-bundle-${_bundlever}.x64.rpm/plugins"
  bsdtar -xf "iscan-plugin-gt-x830-${pkgver}-1.x86_64.rpm"
  if [ -d "usr/lib64" ]; then
    mv 'usr/lib64' 'usr/lib'
  fi
  set +u
}

package() {
  set -u
  cd "iscan-gt-x830-bundle-${_bundlever}.x64.rpm/plugins"
  mv 'usr' "${pkgdir}"
  install -Dpm644 "${pkgdir}/usr/share/doc/${pkgname}-${pkgver}"/* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  rm -r "${pkgdir}/usr/share/doc"
  set +u
}
set +u
