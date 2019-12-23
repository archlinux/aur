
pkgname=pinegrow
pkgver=5.9
pkgrel=1
pkgdesc='A website development tool for building responsive websites'
arch=('x86_64')
url="https://pinegrow.com"
license=('Pinegrow')
depends_x86_64+=(gtk2 gconf alsa-lib nss libxss libxtst gendesk unzip)
source=("http://download.pinegrow.com/PinegrowLinux64.${pkgver}.zip"
        "${url}/Pinegrow_EULA.pdf"
	"${pkgname}.ico::${url}/favicon.ico")
noextract=("Pinegrow_EULA.pdf")
sha512sums=('db0d626d53c858bbd04a8b1e50a316cc13c998556178e159283d049f07e069d903def418c651a248c5bbb2a66df325c39bd8967df74bc1fd8d921748343bccff'
            '9ff47c29e011caf7344ece001ee5cf8ce4f622071b80ee7274b5c0149adbe16fe3764f8a8aa92886c81451b7f3b3af4ba06a120ebd488f62da7590097f9a318f'
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
