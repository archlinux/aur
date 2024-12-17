# Maintainer: Ming Yue <mingyue@ixcm.onmicrosoft.com>

shopt -s extglob

pkgname='liteloader-qqnt-markdown-git'
_pkgname='LiteLoaderQQNT-Markdown'
pkgver='2.4.1.r0.g3af0cdb'
pkgrel=1
pkgdesc="LiteLoaderQQNT插件，为QQ添加Markdown支持"
arch=('any')
url="https://github.com/d0j1a1701/${_pkgname}"
license=("unknown")
depends=("liteloader-qqnt")
makedepends=('npm')
provides=("liteloader-qqnt-markdown-git")
conflicts=("liteloader-qqnt-markdown-git")

source=("git+${url}.git")
sha256sums=('SKIP')
b2sums=('SKIP')

pkgver() {
	cd "${_pkgname}"
	git describe --long --tags --abbrev=7 | sed "s/\([^-]*-g\)/r\1/;s/-/./g"
}

build() {
	cd "${srcdir}/${_pkgname}"
	npm install --cache "${srcdir}/npm-cache"
	npm run prerelease
	# avoid using npm run release because it outputs an archive
}

package() {
    mkdir -p "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    chmod -R 0755 "${pkgdir}/opt/LiteLoaderQQNT"
	cp -rf "${srcdir}/${_pkgname}"/!(node_modules) "${pkgdir}/opt/LiteLoaderQQNT/plugins/${_pkgname}"
    echo "二进制版本在liteloader-qqnt-markdown-bin可用"
}
