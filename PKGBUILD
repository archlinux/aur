_pkgname='webtoon-cli'
pkgname="${_pkgname}-git"
pkgver=r35.33ed6ca
pkgrel=1
pkgdesc='A cli to view webtoons from the web'
arch=('any')
url='https://github.com/DanyB0/webtoon-cli'
license=('MIT')
depends=('python-beautifulsoup4' 'python-requests')
makedepends=('git' 'python-setuptools')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	echo -e "#!/bin/sh\nexec python /usr/share/${_pkgname}/${_pkgname}.py \"\$@\"" > "${_pkgname}.sh"
}

package() {
	install -Dvm755 "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	cd "${srcdir}/${_pkgname}"
	install -Dvm644 'README.md' -t "${pkgdir}/usr/share/doc/${_pkgname}"
	install -Dvm644 'LICENSE' -t "${pkgdir}/usr/share/licenses/${_pkgname}"
	install -dv "${pkgdir}/usr/share/${_pkgname}"
	cp -afv "./${_pkgname}/"* "${pkgdir}/usr/share/${_pkgname}"
}
