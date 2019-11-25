# Maintainer: Laurent Haar laurent.haar@epitech.eu
pkgname=blih-custom
pkgver=1.0
pkgrel=1
pkgdesc="Bocal Lightweight Interface for Humans, git repositories and SSH public keys management tool for EPITECH students"
arch=('any')
url="https://intra-bocal.epitech.eu"
license=('BSD')
depends=('python>=3.3.0'
	'python-requests'
	'git')
provides=('blih')
conflicts=('blih')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/Seres67/${pkgname}/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
	sed -i s/python3.3/python/ "${pkgname}/${pkgname}.py"
}

build() {
        cd "${pkgname}"
	mv "${pkgname}.py" "${pkgname}"
        if [[ -z "${BLIH_USER}" ]]; then
            echo "Please define BLIH_USER env var to your epitech mail address (firstname.lastname@epitech.eu)"
            exit 1
        fi
        sed -i "s|BLIH_USER|\"$BLIH_USER\"|" "${pkgname}"
	chmod 755 "${pkgname}"
        mv "${pkgname}" "blih"
}

package() {
	mkdir -p "${pkgdir}/usr/bin"
	cp -a "${pkgname}/blih" "${pkgdir}/usr/bin"
}
