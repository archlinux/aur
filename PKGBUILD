# Maintainer: Johan Brandhorst <jbrandhorst@buf.build>
# Contributor: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=buf
pkgver=1.0.0rc6
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers"
arch=("any")
url="https://buf.build"
license=('Apache')
makedepends=('go')
source=("https://github.com/bufbuild/buf/archive/v1.0.0-rc6.tar.gz")

build() {
	cd ${pkgname}-1.0.0-rc6
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o . ./cmd/{buf,protoc-gen-buf-lint,protoc-gen-buf-breaking}
	./buf bash-completion >completion.bash
	./buf zsh-completion >completion.zsh
}

package() {
	install -Dm755 "${pkgname}-1.0.0-rc6/buf" "${pkgdir}/usr/bin/buf"
	install -Dm755 "${pkgname}-1.0.0-rc6/protoc-gen-buf-lint" "${pkgdir}/usr/bin/protoc-gen-buf-lint"
	install -Dm755 "${pkgname}-1.0.0-rc6/protoc-gen-buf-breaking" "${pkgdir}/usr/bin/protoc-gen-buf-breaking"
	install -Dm644 "${pkgname}-1.0.0-rc6/completion.bash" "${pkgdir}/etc/bash_completion.d/buf"
	install -Dm644 "${pkgname}-1.0.0-rc6/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_buf"
}

sha256sums=('bc45a334de2fa3906d7ec9d68a51e35b2a9811f0908a5c84d59c7b42a550c037')
