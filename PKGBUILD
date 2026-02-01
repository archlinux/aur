# Maintainer: Lerentis <lerentis@uploadfilter24.eu>

pkgname=overmind-cli-bin
pkgver=v1.14.2
_build=${pkgver:1}
pkgrel=1
pkgdesc='Identify the blast radius and risks for Terraform changes in real time'
url='https://github.com/overmindtech/cli'
arch=(x86_64 aarch64)
license=('FSL-1.1-Apache-2.0')

source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_Linux_x86_64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_Linux_arm64.tar.gz)

noextract=(${pkgname}-${pkgver}-x86_64.tar.gz ${pkgname}-${pkgver}-aarch64.tar.gz)
sha256sums_x86_64=('69d0074e5f598166dd67bcf00fc970ff13c6bd99443b6c86dab42f782e25d94d')
sha256sums_aarch64=('9ef72fa3bfcc3870bf43c051924644a8d040fe3ef59e537858b8758ddf3a8733')

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
