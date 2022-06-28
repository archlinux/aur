# Maintainer: Benoit Brummer <trougnouf at gmail dot com>
pkgname='dvuploader'
_reponame='dataverse-uploader'
_builtname='DVUploader'
pkgver=1.1.0
pkgrel=2
pkgdesc='DVUploader, a Command-line Bulk Uploader for Dataverse and SEAD/Clowder'
url="https://github.com/GlobalDataverseCommunityConsortium/${_reponame}"
depends=('jdk-openjdk')
makedepends=('maven')
license=('APACHE')
arch=('x86_64')
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('8bb87bbdbb3e40c0c4f6589bfbc445863b79ecb38fe4f561fa738b7c2ca7d0f6')

build() {
	cd "${srcdir}/${_reponame}-${pkgver}"
	mvn clean compile assembly:single
}

package() {
	cd "${srcdir}/${_reponame}-${pkgver}/target"
	mkdir -p "${pkgdir}/usr/share/"
	cp "${_builtname}-v${pkgver}.jar" "${pkgdir}/usr/share/"
	mkdir -p "${pkgdir}/usr/bin/"
	echo "exec java -jar /usr/share/${_builtname}-v${pkgver}.jar \"\$@\"" > "${pkgdir}/usr/bin/${_builtname}"
	chmod +x "${pkgdir}/usr/bin/${_builtname}"
}
