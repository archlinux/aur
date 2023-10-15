# Maintainer: Nicolas Goudry <goudry.nicolas@gmail.com>
pkgname=k8sgpt-git
_pkgname=k8sgpt
pkgver=v0.3.18
pkgrel=1
pkgdesc="Giving Kubernetes Superpowers to everyone"
arch=('x86_64' 'arm64' 'i386')
url="http://k8sgpt.ai/"
conflicts=('k8sgpt')
provides=('k8sgpt')
options=()
license=('Apache')
makedepends=('go' 'git')
source=("git+https://github.com/k8sgpt-ai/k8sgpt.git#commit=c5c198e3d6c6426c8f69d765a5a5f0e87854e0fb")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${_pkgname}"
	git describe --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_pkgname}"
	make tidy cover build
}

package() {
	install -Dm755 "${srcdir}/${_pkgname}/bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 "${srcdir}/${_pkgname}"/LICENSE         "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
