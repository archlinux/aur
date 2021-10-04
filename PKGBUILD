# Maintainer: Johan Brandhorst <jbrandhorst@buf.build>
# Contributor: Alexander Menzhinsky <amenzhinsky@gmail.com>
pkgname=buf
pkgver=1.0.0rc3
pkgrel=1
pkgdesc="A new way of working with Protocol Buffers"
arch=("any")
url="https://buf.build"
license=('Apache')
makedepends=('go')
source=("https://github.com/bufbuild/buf/archive/v1.0.0-rc3.tar.gz")

build() {
	cd ${pkgname}-1.0.0-rc3
	go build -trimpath -buildmode=pie -mod=readonly -modcacherw -o . ./cmd/{buf,protoc-gen-buf-lint,protoc-gen-buf-breaking}
	./buf bash-completion >completion.bash
	./buf zsh-completion >completion.zsh
}

package() {
	install -Dm755 "${pkgname}-1.0.0-rc3/buf" "${pkgdir}/usr/bin/buf"
	install -Dm755 "${pkgname}-1.0.0-rc3/protoc-gen-buf-lint" "${pkgdir}/usr/bin/protoc-gen-buf-lint"
	install -Dm755 "${pkgname}-1.0.0-rc3/protoc-gen-buf-breaking" "${pkgdir}/usr/bin/protoc-gen-buf-breaking"
	install -Dm644 "${pkgname}-1.0.0-rc3/completion.bash" "${pkgdir}/etc/bash_completion.d/buf"
	install -Dm644 "${pkgname}-1.0.0-rc3/completion.zsh" "${pkgdir}/usr/share/zsh/site-functions/_buf"
}

sha256sums=('0f438e02634e97352047a6dc6f77cbf6f113842040f78334e4b3bb5bf6603cf7')
