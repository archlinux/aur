pkgname=distribution
pkgver=2.8.2git # fails to build from tag
pkgrel=1
pkgdesc="the Open Source Registry implementation for storing and distributing container images using the OCI Distribution Specification"
arch=(x86_64)
url="https://github.com/distribution/distribution/"
license=('GPL')
depends=('go' 'git')
makedepends=('go')
#source=("git+https://github.com/distribution/distribution.git#tag=v$pkgver")
source=("git+https://github.com/distribution/distribution.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
#	go mod init "github.com/distribution/distribution"
#	go mod vendor
}

build() {
	cd "$pkgname"
	make
}

package() {
	cd "$pkgname"
	install -Dm0755 bin/digest "$pkgdir"/usr/bin/digest
	install -Dm0755 bin/registry "$pkgdir"/usr/bin/registry
	install -Dm0755 bin/registry-api-descriptor-template "$pkgdir"/usr/bin/registry-api-descriptor-template
}
