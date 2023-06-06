# Maintainer: Fuwn <contact@fuwn.me>

pkgname='nectar'
pkgver=0.1.2
pkgrel=1
pkgdesc='Command-line Honeyfeed Reader'
arch=('any')
url='https://github.com/Fuwn/nectar'
license=('GPL-3.0-only')
depends=('gum' 'curl' 'pup' 'pandoc' 'glow')
makedepends=('ruby' 'rubygems' 'git')
source=("git+https://github.com/Fuwn/nectar.git#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
	gem install --user-install bashly
}

pkgver() {
	cd "${srcdir}/${pkgname}"

	git describe --tags "$(git rev-list --tags --max-count=1)" | sed 's/v//'
}

build() {
	cd "${srcdir}/${pkgname}"

	bashly generate
}

package() {
	cd "${srcdir}/${pkgname}"

	mkdir -p "${pkgdir}/usr/bin"

	install -m755 nectar "${pkgdir}/usr/bin/${pkgname}"
}
