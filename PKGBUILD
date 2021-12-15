# Maintainer: Johan Brandhorst <jbrandhorst@buf.build>
# Contributor: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=buf
pkgver=1.0.0rc9
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers"
arch=("any")
url="https://buf.build"
license=('Apache')
makedepends=('go')
source=("https://github.com/bufbuild/buf/archive/v1.0.0-rc9.tar.gz")

build() {
	cd ${pkgname}-1.0.0-rc9
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o . ./cmd/{buf,protoc-gen-buf-lint,protoc-gen-buf-breaking}
	./buf bash-completion >completion.bash
	./buf zsh-completion >completion.zsh
}

package() {
	install -Dm755 "${pkgname}-1.0.0-rc9/buf" "${pkgdir}/usr/bin/buf"
	install -Dm755 "${pkgname}-1.0.0-rc9/protoc-gen-buf-lint" "${pkgdir}/usr/bin/protoc-gen-buf-lint"
	install -Dm755 "${pkgname}-1.0.0-rc9/protoc-gen-buf-breaking" "${pkgdir}/usr/bin/protoc-gen-buf-breaking"
	install -Dm644 "${pkgname}-1.0.0-rc9/completion.bash" "${pkgdir}/etc/bash_completion.d/buf"
	install -Dm644 "${pkgname}-1.0.0-rc9/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_buf"
}

sha256sums=('64badcee7c6a6467699cc706dda1e75804982decf7e2dbcfadfe770404e411a8')
