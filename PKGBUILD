# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=scap-security-guide
pkgver=0.1.77
pkgrel=1
pkgdesc='Collection of Security Content Automation Protocol policy documents'
arch=('any')
url='https://www.open-scap.org/security-policies/scap-security-guide/'
license=('BSD-3-Clause')
makedepends=('ansible-core' 'ansible-lint' 'bats' 'expat' 'libxml2' 'libxslt' 'linkchecker' 'openscap' 'python' 'python-jinja' 'python-json2html' 'python-pytest' 'python-pytest-cov' 'python-recommonmark' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-yaml' 'shellcheck' 'yamllint')
source=("https://github.com/ComplianceAsCode/content/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('1f2aa0c65bc8b7363343125d2f8f2f398e406584c316d52db3bad163674b7884')

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake --install-prefix=/usr ..
	make
}

package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir/" install
}
