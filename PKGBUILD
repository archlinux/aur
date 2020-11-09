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
               "app.asar::https://github.com/varlesh/focal-packages/raw/master/rto-proxy-amd64-app.asar"
               "$_pkgname"
               "$pkgname.install"
               "$_pkgname.desktop")

source_i686=("$_pkgname-$pkgver-$arch.deb::${url}/releases/download/v$pkgver/${_pkgname}_${pkgver}_i386.deb"
             "app.asar::https://github.com/varlesh/focal-packages/raw/master/rto-proxy-amd64-app.asar"
             "$_pkgname"
             "$pkgname.install"
             "$_pkgname.desktop")
sha256sums_x86_64=('b4453fc26b39699d773934138be282256e3baeecad865e35502df193a79fc643'
                   '3aa912e245fa8684cbea0240d244353463a2cc30d885c3cdc83ef160de337a75'
                   '7605ccc2e99e0cbac0f3f9d1dacb38b88c8267dc92c930d63f9599915b9430d1'
                   '076a2f3ae04bec5570933513592c734e3a2815b3557cb01bf8ac3866fab98d01'
                   '5e57413fb8ead1bc5eebd56f3f4eec26a50ab222d54f6a6a283e4bb34ee32db7')

sha256sums_i686=('b4453fc26b39699d773934138be282256e3baeecad865e35502df193a79fc643'
                 '3aa912e245fa8684cbea0240d244353463a2cc30d885c3cdc83ef160de337a75'
                 '7605ccc2e99e0cbac0f3f9d1dacb38b88c8267dc92c930d63f9599915b9430d1'
                 '076a2f3ae04bec5570933513592c734e3a2815b3557cb01bf8ac3866fab98d01'
                 '5e57413fb8ead1bc5eebd56f3f4eec26a50ab222d54f6a6a283e4bb34ee32db7')

package() {
  msg2 "Extracting the data.tar.xz..."
  bsdtar -xf data.tar.xz -C "${pkgdir}/"
# FIX ERROR SEE ---> https://github.com/RutrackerOrg/rutracker-proxy/issues/9
# Thks varlesh for hosting (GitHub)
  install -Dm 755 "${srcdir}/app.asar" "${pkgdir}/opt/${_pkgname}/resources/"
# FIX ERROR SEE ---> https://github.com/RutrackerOrg/rutracker-proxy/issues/19#issuecomment-619498712
  install -dm 755 "${pkgdir}/usr/bin/"
  install -Dm 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/"
  install -Dm 755 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/"
}
