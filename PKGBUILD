# Maintainer: Buf <bot@buf.build>
# Contributor: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=buf
pkgver=1.12.0
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers"
arch=("any")
url="https://buf.build"
license=('Apache')
makedepends=('go')
source=("https://github.com/bufbuild/buf/archive/v1.12.0.tar.gz")

build() {
	cd ${pkgname}-1.12.0
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -buildvcs=false -o . ./cmd/{buf,protoc-gen-buf-lint,protoc-gen-buf-breaking}
	./buf completion bash >completion.bash
	./buf completion zsh >completion.zsh
	./buf completion fish >completion.fish
	mkdir -p manpages
	./buf manpages manpages
}

package() {
	install -Dm755 "${pkgname}-1.12.0/buf" "${pkgdir}/usr/bin/buf"
	install -Dm755 "${pkgname}-1.12.0/protoc-gen-buf-lint" "${pkgdir}/usr/bin/protoc-gen-buf-lint"
	install -Dm755 "${pkgname}-1.12.0/protoc-gen-buf-breaking" "${pkgdir}/usr/bin/protoc-gen-buf-breaking"
	install -Dm644 "${pkgname}-1.12.0/completion.bash" "${pkgdir}/etc/bash_completion.d/buf"
	install -Dm644 "${pkgname}-1.12.0/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_buf"
	install -Dm644 "${pkgname}-1.12.0/completion.fish" "${pkgdir}/usr/share/fish/vendor_completions.d/buf.fish"
	install -Dm644 "${pkgname}-1.12.0/manpages/${pkgname}"* -t "${pkgdir}/usr/share/man/man1/"
}

sha256sums=('b7cc774fb13758500de5d0c5f74b09cf3f6e5597420b7c762e01ed195e102a2d')
