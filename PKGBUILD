# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Bazon <bazonbloch@arcor.de>
pkgname=activinspire-sk
pkgver=2.10.66827
pkgrel=1
pkgdesc="Presentation Software to use with Promethean Hardware products - SK language pack"
arch=('any')
url="https://support.prometheanworld.com/product/activinspire"
license=('unknown')
depends=('activinspire')

lang=${pkgname/activinspire-/}
_u="http://activsoftware.co.uk/linux/repos/ubuntu/pool/non-oss/a/"
source=()

source+=(
	${_u}activinspire-help-${lang}/activinspire-help-${lang}_1.0.2-14_all.deb
	${_u}activresources-core-${lang}/activresources-core-${lang}_1.0.1-147_all.deb
	)

noextract=("${source[@]##*/}")

prepare() {
	cd $srcdir

	[ ! -d core.${lang} ] && mkdir core.${lang}
	bsdtar -C core.${lang} -xf activresources-core-${lang}_1.0.1-147_all.deb
	bsdtar -C core.${lang} -xf core.${lang}/data.tar.gz

	[ ! -d help.${lang} ] && mkdir help.${lang}
	bsdtar -C help.${lang} -xf activinspire-help-${lang}_1.0.2-14_all.deb
	bsdtar -C help.${lang} -xf help.${lang}/data.tar.gz
}

package() {
	mkdir -p ${pkgdir}/usr/bin
	mv $srcdir/core.${lang}/var ${pkgdir}/var
	mv $srcdir/help.${lang}/usr/local/bin ${pkgdir}/usr
	
}
md5sums=('cd9eb604c00d26db50c09678ef4559e2'
         'd19deb72eb1b13d4ece18ee5d126e064')
