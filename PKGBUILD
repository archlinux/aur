# Maintainer: Márcio Sousa Rocha <marciosr10@gmail.com>


pkgname=receitanet
pkgver=1.09
pkgrel=1
license=('custom')

arch=(any)
pkgdesc='Programa Oficial da Receita para envio do IRPF'
url='http://www.receita.fazenda.gov.br'

source=(http://www.receita.fazenda.gov.br/publico/programas/receitanet/receitanet-1.09-1.noarch.rpm
        Copyright
        $pkgname.install)
        
md5sums=('ac01c9b1ee0ec50fc5f7d1e27bfb90c4'
         '0482abdccc0286f64ed66981fcca8975'
         '339dcd1387350f6eb9ebb9f944f6b616')

depends=('java-runtime=8' 'hicolor-icon-theme' 'desktop-file-utils')
install=$pkgname.install

prepare() {
	cd "$srcdir"/usr/share/applications
	sed -i "s|java -jar '/opt/Programas\ RFB/Receitanet/receitanet.jar'|receitanet|" rfb-receitanet.desktop
	sed -i 's|/opt/Programas\ RFB/Receitanet/imagens/Receitanet.xpm|receitanet|' rfb-receitanet.desktop
	echo 'Categories=Network;' >> rfb-receitanet.desktop
}

package() {
	cd "$srcdir"/opt/Programas\ RFB/Receitanet
	
	install -d "$pkgdir"/usr/{bin,share/{icons/hicolor/32x32/apps,applications,licenses/receitanet,receitanet}}
	
	cp -rf lib "$pkgdir"/usr/share/receitanet/
	
	install -Dm644 receitanet.dat "$pkgdir"/usr/share/receitanet/
	install -Dm644 receitanet.jar "$pkgdir"/usr/share/receitanet/
	
	install -Dm644 imagens/Receitanet.xpm "$pkgdir"/usr/share/icons/hicolor/32x32/apps/receitanet.xpm
	install -Dm644 "$srcdir"/usr/share/applications/rfb-receitanet.desktop "$pkgdir"/usr/share/applications/receitanet.desktop
	
	install -Dm644 "$srcdir"/Copyright "$pkgdir"/usr/share/licenses/receitanet/
	
	echo -e '#!/bin/sh\ncd /usr/share/receitanet' > "$pkgdir"/usr/bin/receitanet
	echo 'java -jar /usr/share/receitanet/receitanet.jar' >> "$pkgdir"/usr/bin/receitanet
	
	chmod 755 "$pkgdir"/usr/bin/receitanet
}
