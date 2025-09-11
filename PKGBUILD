# Maintainer: Alex Henrie <alexhenrie24@gmail.com>
pkgname=sbom-tool
pkgver=4.1.1
pkgrel=1
pkgdesc='Tool to create SPDX 2.2 compatible SBOMs'
arch=('x86_64')
url='https://github.com/microsoft/sbom-tool'
license=('MIT')
makedepends=('dotnet-sdk')
options=('!strip')
source=("https://github.com/microsoft/sbom-tool/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('6c1a34e17ddd1eeff5e0de298cd8cc9cd53e8920cdee572dcff3eaf239e87d3a')

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
