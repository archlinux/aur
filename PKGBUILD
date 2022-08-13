# Maintainer: katt <magunasu.b97@gmail.com>

pkgname=gofile-downloader-git
pkgver=r16.465ef97
pkgrel=1
pkgdesc='Download files from https://gofile.io'
arch=(any)
url=https://github.com/ltsdw/gofile-downloader
license=(GPL3)
depends=(python python-certifi python-charset-normalizer python-idna python-requests python-urllib3)
makedepends=(git)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(git+"${url}".git)
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	# Add missing shebang
	sed -i '1 i #!/usr/bin/env python3' "${pkgname%-git}"/"${pkgname%-git}".py
}

package() {
	install -Dm755 "${pkgname%-git}/${pkgname%-git}.py" "${pkgdir}/usr/bin/${pkgname%-git}"
}
