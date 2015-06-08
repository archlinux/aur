# Maintainer: FadeMind <fademind@gmail.com>
# Contributor: Alois Nespor <info@aloisnespor.info>
# Contributor: Tianjiao Yin <ytj000+aur@gmail.com>

pkgname=firefox-extension-fireftp
pkgver=2.0.24
pkgrel=1
pkgdesc="A free, secure, cross-platform FTP/SFTP client for Mozilla Firefox."
url="https://addons.mozilla.org/firefox/addon/fireftp"
arch=('any')
license=('MPL')
depends=("firefox")
source=("$pkgname-$pkgver.xpi::https://addons.cdn.mozilla.net/user-media/addons/684/fireftp-$pkgver-sm+fx.xpi")
sha256sums=('caeb5283f421d8e9dc9aabd65f938af0e53c53898ea45c2dcfda65cddcfc3b81')

package() {
  cd $srcdir
  local emid=$(sed -n -e '/<\?em:id>\?/!d; s/.*\([\"{].*[}\"]\).*/\1/; s/\"//g; p; q' install.rdf)
  local dstdir=$pkgdir/usr/lib/firefox/browser/extensions/${emid}
  [ -n ${emid} ] || return 1
  install -d $dstdir
  sed -i 's#<em:maxVersion>.*</em:maxVersion>#<em:maxVersion>32.*</em:maxVersion>#' install.rdf
  cp -R * $dstdir
  rm $dstdir/*.xpi
  find $pkgdir -type d -exec chmod 0755 {} \;
  find $pkgdir -type f -exec chmod 0644 {} \;

}


