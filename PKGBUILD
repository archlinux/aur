# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
_pkgname='devtoys'
pkgname="${_pkgname}-bin"
provides=(${_pkgname})
conflicts=(${_pkgname})
pkgver=2.0.3.0
pkgrel=1
scdir=$_pkgname
_pkgver="${pkgver//_/-}"
_gitname="release-${_pkgver}"
pkgdesc="A Swiss Army knife for developers."
arch=('x86_64' 'aarch64')
url="https://github.com/DevToys-app/DevToys"
license=('MIT')
depends=(
	'webkitgtk-6.0'
	'libadwaita'
)
provides=(${_pkgname})
conflicts=(${_pkgname})
source=(${_pkgname}.desktop)
source_x86_64=("${_pkgname}-${pkgver}_x64.deb::https://github.com/DevToys-app/DevToys/releases/download/v$pkgver/devtoys_linux_x64.deb")
source_aarch64=("${_pkgname}-${pkgver}_arm.deb::https://github.com/DevToys-app/DevToys/releases/download/v$pkgver/devtoys_linux_arm.deb")
sha256sums=('0c9daf652ca76bd6433572e431ac7bd0f20958e9c542e60f6389bd56936fedc1')
sha256sums_x86_64=('bb3eed108ef8fdb3ca4ec81615344cf5b37908d7befea7c39677e99717d1c6bb')
sha256sums_aarch64=('867c71e6f9f2a553cf6f4c103cf17005cffdf5348670c3cb2fd1d3c6f38a7ffd')

package() {
	tar xf data.tar.zst -C "${pkgdir}"
	install -d "${pkgdir}/opt/${_pkgname}"
	cd $srcdir

	rm "${pkgdir}/usr/share/applications/devtoys.desktop"
	install -Dm644 "${srcdir}/${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
	ln -sf "/opt/$_pkgname/$_pkgname" "${pkgdir}/usr/bin/$_pkgname"
}
