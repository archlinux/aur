# Maintainer: Johan Brandhorst <jbrandhorst@buf.build>
# Contributor: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=buf
pkgver=0.46.0
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers"
arch=("any")
url="https://buf.build"
license=('Apache')
makedepends=('go')
source=("https://github.com/bufbuild/buf/archive/v${pkgver}.tar.gz")

build() {
	cd ${pkgname}-${pkgver}
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o . ./cmd/{buf,protoc-gen-buf-check-lint,protoc-gen-buf-check-breaking}
	./buf bash-completion >completion.bash
	./buf zsh-completion >completion.zsh
}

package() {
	install -Dm755 "${pkgname}-${pkgver}/buf" "${pkgdir}/usr/bin/buf"
	install -Dm755 "${pkgname}-${pkgver}/protoc-gen-buf-check-lint" "${pkgdir}/usr/bin/protoc-gen-buf-check-lint"
	install -Dm755 "${pkgname}-${pkgver}/protoc-gen-buf-check-breaking" "${pkgdir}/usr/bin/protoc-gen-buf-check-breaking"
	install -Dm644 "${pkgname}-${pkgver}/completion.bash" "${pkgdir}/etc/bash_completion.d/buf"
	install -Dm644 "${pkgname}-${pkgver}/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_buf"
}

sha256sums=('eedb4fefdd21e01491f4278e4bb91f75f69cf19c8e0caf8760d67c7935180f32')
