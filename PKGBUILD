# Maintainer: Felix Desyatirikov <felixdesyatirikov@gmail.com>
pkgname=amd-boost-toggle-git
_pkgname=amd-boost-toggle
pkgver=1.0
pkgrel=1
pkgdesc="A turbo boost switch for AMD processors"
arch=('x86_64')
url="https://github.com/FelixDes/amd-boost-toggle"
license=('MIT')
makedepends=('git')
depends=('libxcrypt-compat' 'java-environment')
source=("git+${url}.git")
sha256sums=("SKIP")
conflicts=("amd-boost-toggle")

build() {
	cd "${srcdir}/${_pkgname}"
    ./gradlew linkReleaseExecutableNative
}

package() {
	cd "${srcdir}/${_pkgname}"
	cp ./build/bin/native/releaseExecutable/amd-boost-toggle.kexe ./amd-boost-toggle
	install -Dm755 ./amd-boost-toggle "${pkgdir}/usr/bin/${_pkgname}"
	install -Dm644 ./README.md "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
	install -Dm644 ./LICENSE ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE
}
