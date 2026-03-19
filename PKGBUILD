# Maintainer: Lerentis <lerentis@uploadfilter24.eu>

pkgname=overmind-cli-bin
pkgver=v1.17.1
_build=${pkgver:1}
pkgrel=1
pkgdesc='Identify the blast radius and risks for Terraform changes in real time'
url='https://github.com/overmindtech/cli'
arch=(x86_64 aarch64)
license=('FSL-1.1-Apache-2.0')

source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_Linux_x86_64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_Linux_arm64.tar.gz)

noextract=(${pkgname}-${pkgver}-x86_64.tar.gz ${pkgname}-${pkgver}-aarch64.tar.gz)
sha256sums_x86_64=('ed51d63de1d355590e6b45ef12226c2455e63acf38cc27c93db209a6cc511b1f')
sha256sums_aarch64=('cd0ed0c8a5e7f72a009c865ce296425acfb98478550593eb7f215af258309adb')

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
