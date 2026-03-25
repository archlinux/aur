# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>

_author=conan-io
_basename=conan
pkgname=${_basename}-bin
pkgver=2.27.0
pkgrel=1
pkgdesc="A distributed, open source, C/C++ package manager."
arch=('x86_64' 'aarch64')
url="https://conan.io"
_github_url="https://github.com/${_author}/${_basename}"
_github_urlraw="https://raw.githubusercontent.com/${_author}/${_basename}/${pkgver}"
license=('MIT')
conflicts=("${_basename}")
provides=("${_basename}")
makedepends=('tar')
depends=('zlib' 'glibc' 'libxcrypt-compat')
source=("LICENSE-${pkgver}::${_github_urlraw}/LICENSE.md"
        "README-${pkgver}.md::${_github_urlraw}/README.md")
source_x86_64=("${_github_url}/releases/download/${pkgver}/${_basename}-${pkgver}-linux-x86_64.tgz")
source_aarch64=("${_github_url}/releases/download/${pkgver}/${_basename}-${pkgver}-linux-aarch64.tgz")
sha256sums=('cb0cfe10fad4eeb3ec0c1482474ddae67dcf2b2715cfd58655f6d18e5ce92aac'
            'a773d64c701223fcf203bbc19c0ee7449d14e4c4fb552056c62aab0a72ccdcd0')
sha256sums_x86_64=('2f96e3a820c8558781be38f5c85e7c54e1ab4215c99bc65e2279bd2b41dbb77a')
sha256sums_aarch64=('d931e7c1d0b09347cbcd455c75fa0cfc0ee783ab794ca5b79ab874159fd2f045')

package() {
	cd "${srcdir}/" || return 1

	mkdir -p "${pkgdir}/opt/${_basename}"
	cp -raf "bin" "${pkgdir}/opt/${_basename}/"

	mkdir -p "${pkgdir}/usr/bin"
	ln -rsf "${pkgdir}/opt/${_basename}/bin/${_basename}" "${pkgdir}/usr/bin/${_basename}"

	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
