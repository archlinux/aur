# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=scap-security-guide-git
pkgver=0.1.61.r10285.g1a50ebd191
pkgrel=1
pkgdesc='Collection of Security Content Automation Protocol policy documents'
arch=('any')
url='https://www.open-scap.org/security-policies/scap-security-guide/'
license=('BSD')
makedepends=('ansible-core' 'ansible-lint' 'bash-bats' 'expat' 'libxml2' 'libxslt' 'linkchecker' 'openscap' 'python' 'python-jinja' 'python-json2html' 'python-pytest' 'python-pytest-cov' 'python-recommonmark' 'python-sphinx' 'python-sphinx_rtd_theme' 'python-yaml' 'shellcheck' 'yamllint')
source=('git+https://github.com/ComplianceAsCode/content.git')
provides=('scap-security-guide')
sha256sums=('SKIP')

pkgver() {
	cd content
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
	cd content
	mkdir -p build
	cd build
	cmake --install-prefix=/usr ..
	make
}

package() {
	cd content/build
	make DESTDIR="$pkgdir/" install
}
