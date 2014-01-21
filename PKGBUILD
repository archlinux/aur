# check for new commits:
# https://gitweb.torproject.org/https-everywhere.git/shortlog
# https://github.com/EFForg/https-everywhere/commits/master

pkgbase=https-everywhere
pkgname=${pkgbase}-chrome-git
pkgver=22343.a6f23fd
pkgrel=1
pkgdesc="Chrome/Chromium extension to use HTTPS whenever possible - git/dev"
arch=('any')
url='https://www.eff.org/https-everywhere'
license=('GPL')
makedepends=(git perl python2-lxml libxml2 vim zip)
source=("git+https://github.com/EFForg/${pkgbase}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgbase}"
	local ver="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
	printf "%s" "${ver//-/.}"
}

build() {
	cd "${srcdir}/${pkgbase}"
	./makecrx.sh
}

package() {
	 mkdir -p "${pkgdir}/usr/share/${pkgname}"
	 shopt -s dotglob
	 cp -dr --no-preserve=ownership "${srcdir}/${pkgbase}/pkg/crx"/* "${pkgdir}/usr/share/${pkgname}"
}
