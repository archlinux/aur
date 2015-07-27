# Maintainer: jdarch <jda -dot- cloud -plus- archlinux -at- gmail -dot- com>

pkgname=amdlibm
pkgver=3.1
pkgrel=2
pkgdesc="AMD math library for Linux, standard and vectorized libM functions"
arch=("x86_64")
options=('staticlibs')
url=('http://developer.amd.com/tools-and-sdks/cpu-development/libm/')
license=(custom)

source=("http://developer.amd.com/amd-license-agreement/?f=amdlibm-3.1-lin64.tar.gz")
DLAGENTS=('http::/usr/bin/curl -fLC - --retry 3 --retry-delay 3 \
        -d amd_developer_central_nonce=5c1a9cd425 \
        -d _wp_http_referer=/amd-license-agreement/?f=amdlibm-3.1-lin64.tar.gz \
        -d f=YW1kbGlibS0zLjEtbGluNjQudGFyLmd6 \
        -o %o')
md5sums=('4f3face6fa0391188a4aa6dce0a891da')
sha512sums=('4ed16c953ea0a4b4f672c34333d17841cf939c75a12106161b3bd619d4fcdff17ea9043b665e9318a605fd02c607dc0ecbf4cde78de26d9193022c8ca556ddbc')

package(){
	mkdir -p "${pkgdir}/usr/share/licenses/amdlibm"
	mkdir -p "${pkgdir}/usr/include"
	mkdir -p "${pkgdir}/usr/lib"
	mkdir -p "${pkgdir}/opt/amdlibm/examples"

	cp "${srcdir}/amdlibm-${pkgver}-lin64/lib/static/"*	"${pkgdir}/usr/lib/"
	cp "${srcdir}/amdlibm-${pkgver}-lin64/lib/dynamic/"*	"${pkgdir}/usr/lib/"

	cp "${srcdir}/amdlibm-${pkgver}-lin64/include/"*	"${pkgdir}/usr/include/"
	cp "${srcdir}/amdlibm-${pkgver}-lin64/examples/"*	"${pkgdir}/opt/amdlibm/examples/"
	cp "${srcdir}/amdlibm-${pkgver}-lin64/ReleaseNotes.txt"	"${pkgdir}/opt/amdlibm/"
	cp "${srcdir}/amdlibm-${pkgver}-lin64/amdlibm 3.1 quick reference.pdf"	"${pkgdir}/opt/amdlibm/"

	rm "${pkgdir}/opt/amdlibm/examples/build_and_run.bat"

	install -D -m644 "${srcdir}/amdlibm-${pkgver}-lin64/LICENSE.pdf"	"${pkgdir}/usr/share/licenses/amdlibm/LICENSE.pdf"
}
