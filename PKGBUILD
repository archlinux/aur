# Maintainer: Oleksandr Natalenko <oleksandr@natalenko.name>
# Contributor: Jakub Klinkovský <j.l.k@gmx.com>

pkgname=hyphen-cs
pkgdesc="Czech hyphenation rules"
pkgver=20210721
_rev=b3a1c0be50d1ad0b404070124463fb4af90bbe39
pkgrel=1
arch=(any)
optdepends=("hyphen: offers hyphenation library functions")
url=https://github.com/LibreOffice/dictionaries
license=(custom:GFDL)
source=(https://github.com/LibreOffice/dictionaries/raw/${_rev}/cs_CZ/hyph_cs_CZ.dic
		https://raw.githubusercontent.com/LibreOffice/dictionaries/${_rev}/cs_CZ/README_cs.txt)
sha256sums=('a378d024438b446ac0524237dc6d728dc520550db5fe0fb1fdbb47c2ee0ca525'
            '24d1d07409b62e8e6f0ee114991d4749d3e97b05ea19feca835916af67312720')

build() {
	true
}

package() {
	install -Dt "${pkgdir}"/usr/share/hyphen -m0644 hyph_cs_CZ.dic

	install -dm0755 "${pkgdir}"/usr/share/myspell/dicts
	pushd "${pkgdir}"/usr/share/myspell/dicts
		for file in "${pkgdir}"/usr/share/hyphen/*; do
			ln -sv /usr/share/hyphen/$(basename $file) .
		done
	popd

    install -Dt "${pkgdir}"/usr/share/doc/${pkgname} -m0644 README_cs.txt
}
