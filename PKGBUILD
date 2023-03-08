# Maintainer: Buf <bot@buf.build>
# Contributor: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=buf
pkgver=1.15.1
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers"
arch=("any")
url="https://buf.build"
license=('Apache')
makedepends=('go')
source=("https://github.com/bufbuild/buf/archive/v1.15.1.tar.gz")

build() {
	cd ${pkgname}-1.15.1
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -buildvcs=false -o . ./cmd/{buf,protoc-gen-buf-lint,protoc-gen-buf-breaking}
	./buf completion bash >completion.bash
	./buf completion zsh >completion.zsh
	./buf completion fish >completion.fish
	mkdir -p manpages
	./buf manpages manpages
}

package() {
	install -Dm755 "${pkgname}-1.15.1/buf" "${pkgdir}/usr/bin/buf"
	install -Dm755 "${pkgname}-1.15.1/protoc-gen-buf-lint" "${pkgdir}/usr/bin/protoc-gen-buf-lint"
	install -Dm755 "${pkgname}-1.15.1/protoc-gen-buf-breaking" "${pkgdir}/usr/bin/protoc-gen-buf-breaking"
	install -Dm644 "${pkgname}-1.15.1/completion.bash" "${pkgdir}/etc/bash_completion.d/buf"
	install -Dm644 "${pkgname}-1.15.1/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_buf"
	install -Dm644 "${pkgname}-1.15.1/completion.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/buf.fish"
	install -Dm644 "${pkgname}-1.15.1/manpages/${pkgname}"* -t "${pkgdir}/usr/share/man/man1/"
}

sha256sums=('b41e98ee5e2beecf21a90c657acdfc7a86cec3e5a60a333984ecb9184f9f5fec')
