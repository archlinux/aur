# Maintainer: Mark Riedesel <mark@klowner.com>

_basename=GENie
pkgname=${_basename,,}-git
pkgver=r715.a184142
pkgrel=1
pkgdesc="GENie project generator tool (a fork of premake by Branimir Karadžić)"
arch=('x86_64' 'arm' 'i686')
url='https://github.com/bkaradzic/GENie'
makedepends=('git')
source=("git+https://github.com/bkaradzic/GENie#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "${_basename}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_basename}"
	make
}

package() {
	cd "${_basename}"

	# Install the binary
	install -D -m755 "${srcdir}/${_basename}/bin/linux/genie" \
		"${pkgdir}/usr/bin/genie"

	# Install the readme
	install -D -m644 "${srcdir}/${_basename}/README.md" \
		"${pkgdir}/usr/share/doc/${_basename}/README.md"

	# Install the license
	install -D -m644 "${srcdir}/${_basename}/LICENSE" \
		"${pkgdir}/usr/share/licenses/${_basename}/LICENSE"
}
