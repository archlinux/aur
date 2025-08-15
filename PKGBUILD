# Maintainer: Shiina Rikka <rikka@rikka.im>

pkgname=step-ca-cgo
pkgver=v0.25.3.rc7.r824.g9c485c5
pkgrel=1
pkgdesc="A private certificate authority (X.509 & SSH) & ACME server for secure automated certificate management, so you can use TLS everywhere & SSO for SSH. Using CGO build."
arch=(x86_64)
url="https://github.com/smallstep/certificates"
license=(Apache)
depends=(glibc pcsclite)
makedepends=(go)
provides=(step-ca)
conflicts=(step-ca)
source=('step-ca-cgo::git+https://github.com/smallstep/certificates.git')
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	make bootstrap && make build GO_ENVS="CGO_ENABLED=1" GOFLAGS="-trimpath"
}

package() {
  install -Dm755 "$pkgname/bin/step-ca" "$pkgdir/usr/bin/step-ca"
}
