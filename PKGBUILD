
pkgname=pinegrow
pkgver=5.8
pkgrel=1
pkgdesc='A website development tool for building responsive websites'
arch=('x86_64')
url="https://pinegrow.com"
license=('Pinegrow')
depends_x86_64+=(gtk2 gconf alsa-lib nss libxss libxtst gendesk)
source=("http://download.pinegrow.com/PinegrowLinux64.${pkgver}.zip"
        "${url}/Pinegrow_EULA.pdf"
	"${pkgname}.ico::${url}/favicon.ico")
noextract=("Pinegrow_EULA.pdf")
sha512sums=('SKIP'
            '75b36c2e324d6ee01aa381c28a35593d861c16a551ce3b4be35cafbdcdd17e19ee9aeb56a2032d3a22206df398cbe3b9bd1e4c7bb03db00b5362440e286b3af5'
	    '96f42cb4b4dfaef72b3868bbc89975a2987cbd9a1b2cb53de16409d654a77c367712eaf5bc7dceed93ea25a19a5e9df3075a166cd03c0d959ac873b941b771b8')

options=('!strip')
install=${pkgname}.install

prepare() {
  cd "${srcdir}"

  unzip -qqo "PinegrowLinux64.${pkgver}.zip" -d "Pinegrow-${pkgver}"

  cd Pinegrow-${pkgver}
  gendesk --pkgname "$pkgname" --pkgdesc "$pkgdesc"
}

package() {
  cd ${srcdir}
  install -D -m644 Pinegrow_EULA.pdf ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.md
  install -d ${pkgdir}/usr/share/pinegrow/
  cd Pinegrow-${pkgver}
  cp -R * ${pkgdir}/usr/share/pinegrow/
  install -Dm644 "$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 ${srcdir}/$pkgname.ico $pkgdir/usr/share/pixmaps/$pkgname.ico
}
