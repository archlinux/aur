# Maintainer: Lerentis <lerentis@uploadfilter24.eu>

pkgname=overmind-cli-bin
pkgver=v1.7.8
_build=${pkgver:1}
pkgrel=1
pkgdesc='Identify the blast radius and risks for Terraform changes in real time'
url='https://github.com/overmindtech/cli'
arch=(x86_64 aarch64)
license=('FSL-1.1-Apache-2.0')

source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_${_build}_Linux_x86_64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_${_build}_Linux_arm64.tar.gz)

noextract=(${pkgname}-${pkgver}-x86_64.tar.gz ${pkgname}-${pkgver}-aarch64.tar.gz)
sha256sums_x86_64=('95ac07d469b456f248e115b835dd07a95f36db06b38a384f6c55467551392115')
sha256sums_aarch64=('2c11c8991e105f46f70ea4df6d94b66c899386344aa21e6fe78a27e4594ea978')

prepare() {
	mkdir -p overmind
	bsdtar -xf "$pkgname-$pkgver-$CARCH.tar.gz" -C overmind
	chmod +x overmind/overmind
}

package() {
	install -dm0755 "$pkgdir/opt"
	cp -a overmind "$pkgdir/opt/$pkgname"

    install -Dm755 ${srcdir}/overmind/overmind ${pkgdir}/usr/bin/overmind
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" ${srcdir}/overmind/LICENSE
}
