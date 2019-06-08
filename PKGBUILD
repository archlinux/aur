# Maintainer: Thomas Pointhuber <thomas.pointhuber@@gmx..at>
# Based on the DCP-J552DW PKGBUILD -> Marius Rejdak <mariuswol at gmail dot com>
pkgname=brother-dcpj572dw
pkgver=1.0.5
pkgrel=1
pkgdesc="Driver for the Brother DCP-J772DW wifi multifunctional printer"
url="https://support.brother.com/g/b/downloadlist.aspx?c=ch&lang=de&prod=dcpj572dw_eu_as&os=127"
license=('custom:brother')
optdepends=('brscan4: scanner support'
            'brscan-skey: remote scan support')
makedepends=('bash')
install='brother-dcpj572dw.install'
arch=('i686' 'x86_64')

sha256sums=('190b9b9a0f53db624db06e433acbee99876f49dc0da40478a3af6afefedf51c4'
            'cae9133aed983ffb64f8cd98bc13e93036e7d5fe78d2514b8c74845ca3be3882')

source=(
	"fix_lp.patch" \
	"https://download.brother.com/welcome/dlf103778/dcpj572dwpdrv-$pkgver-0.i386.rpm"
)

build() {
    cd "$srcdir"
    patch -Np0 < fix_lp.patch
}

package()
{
    install -d "$pkgdir"/usr/bin
    install -Dm755 "$srcdir"/usr/bin/brprintconf_dcpj572dw "$pkgdir"/usr/bin/
    cp -R "$srcdir"/opt "$pkgdir"/opt
}

