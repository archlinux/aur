# Maintainer: Sam Whited <sam@samwhited.com>

pkgname=writeas-cli-git
pkgver=v1.2_2_ge05f5bd94323
pkgrel=1
pkgdesc="Write.as command line interface"
arch=('x86_64')
url='https://write.as/apps/cli'
license=('GPL3')
depends=('glibc')
source=("${pkgname}::git+https://code.as/writeas/writeas-cli.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --tags --long | sed s/-/_/g
}

prepare() {
	cd ${pkgname}
	rm -f go.mod
	go mod init github.com/writeas/writeas-cli
}

build() {
	cd ${pkgname}
	go build ./cmd/writeas/
}

package() {
	install -Dm755 "${srcdir}/${pkgname}/writeas" "${pkgdir}/usr/bin/writeas"
}
