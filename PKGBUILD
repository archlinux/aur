# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=scap-security-guide
pkgver=0.1.57
pkgrel=1
pkgdesc='Collection of Security Content Automation Protocol policy documents'
arch=('any')
url='https://www.open-scap.org/security-policies/scap-security-guide/'
license=('BSD')
makedepends=('ansible-core' 'ansible-lint' 'bash-bats' 'expat' 'libxml2' 'libxslt' 'linkchecker' 'openscap' 'python' 'python-jinja' 'python-json2html' 'python-pytest' 'python-pytest-cov' 'python-recommonmark' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-yaml' 'shellcheck' 'yamllint')
source=("https://github.com/ComplianceAsCode/content/releases/download/v$pkgver/$pkgname-$pkgver.tar.bz2")
sha256sums=('663f897ee89419463e3e06c2ae93a96c6e22b9a54d3a54ca8f174d9b159afeaa')

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
