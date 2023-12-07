# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=sbom-tool
pkgver=2.2.1
pkgrel=1
pkgdesc='Tool to create SPDX 2.2 compatible SBOMs'
arch=('x86_64')
url='https://github.com/microsoft/sbom-tool'
license=('MIT')
makedepends=('dotnet-sdk')
options=('!strip')
source=("https://github.com/microsoft/sbom-tool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c5e59a930b1aa728a38289a5fcd7a513f7cb8858e0c6a35a5909449a887b10f')

build() {
	cd "$pkgname-$pkgver"
	dotnet publish \
		--runtime linux-x64 \
		--self-contained true \
		-p:DebugType=None \
		-p:DebugSymbols=false \
		-p:PublishSingleFile=true \
		-p:IncludeAllContentForSelfExtract=true \
		--framework net8.0 \
		src/Microsoft.Sbom.Tool
}

package() {
	cd "$pkgname-$pkgver"
	install \
		-Dm755 \
		src/Microsoft.Sbom.Tool/bin/Release/net8.0/linux-x64/publish/Microsoft.Sbom.Tool \
		"$pkgdir/usr/bin/sbom-tool"
}
