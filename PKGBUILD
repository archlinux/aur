#Maintainer: naruto522ru <itachi522ru@gmail.com>
_pkgname=rto-proxy
pkgname=rto-proxy-bin
pkgver=0.2.3
pkgrel=7
pkgdesc='RuTracker proxy app based at electron + angularjs'
arch=('x86_64' 'i686')
url='https://github.com/RutrackerOrg/rutracker-proxy'
license=('MIT')
depends=('gconf' 'libnotify' 'libappindicator-gtk2' 'libxtst' 'libxss' 'nss' 'pango-legacy')
install=rto-proxy-bin.install

source_x86_64=("$_pkgname-$pkgver-$arch.deb::${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_amd64.deb"
               "https://www.dropbox.com/s/ghpvkkifaw6qrh8/app.asar"
               "$_pkgname"
               "$pkgname.install"
               "$_pkgname.desktop")

source_i686=("$_pkgname-$pkgver-$arch.deb::${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_i386.deb"
             "https://www.dropbox.com/s/ghpvkkifaw6qrh8/app.asar"
             "$_pkgname"
             "$pkgname.install"
             "$_pkgname.desktop")

md5sums_x86_64=('ba8229621770652696b07152d15d703b'
                '97dcbd2db3810aa62b02f24a6fa06b92'
                'ffb38c0f5a441332254c739b665f3d35'
                'd3547df21d6cf86a2a2dcb9d96739127'
                '9478d801cb2285b39e549268c9e17a82'
)
md5sums_i686=('4d7ccd828131840f15b382ce5d08ff3b'
              '97dcbd2db3810aa62b02f24a6fa06b92'
              'ffb38c0f5a441332254c739b665f3d35'
              'd3547df21d6cf86a2a2dcb9d96739127'
              '9478d801cb2285b39e549268c9e17a82'
)

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "$pkgdir/"
# FIX ERROR SEE ---> https://github.com/RutrackerOrg/rutracker-proxy/issues/9
  install -Dm 755 "$srcdir/app.asar" "$pkgdir/opt/$_pkgname/resources/"
# FIX ERROR SEE ---> https://github.com/RutrackerOrg/rutracker-proxy/issues/19#issuecomment-619498712
  install -dm 755 "$pkgdir/usr/bin/"
  install -Dm 755 "$srcdir/${_pkgname}" "$pkgdir/usr/bin/"
  install -Dm 755 "$srcdir/${_pkgname}.desktop" "$pkgdir/usr/share/applications/"
}
