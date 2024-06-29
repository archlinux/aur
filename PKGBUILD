# Maintainer: Lerentis <lerentis@uploadfilter24.eu>

pkgname=overmind-cli-bin
pkgver=v1.0.10
_build=${pkgver:1}
pkgrel=1
pkgdesc='Identify the blast radius and risks for Terraform changes in real time'
url='https://github.com/overmindtech/cli'
arch=(x86_64 aarch64)
license=('FSL-1.1-Apache-2.0')

source_x86_64=(${pkgname}-${pkgver}-x86_64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_${_build}_Linux_x86_64.tar.gz)
source_aarch64=(${pkgname}-${pkgver}-aarch64.tar.gz::https://github.com/overmindtech/cli/releases/download/${pkgver}/overmind_cli_${_build}_Linux_arm64.tar.gz)

noextract=(${pkgname}-${pkgver}-x86_64.tar.gz ${pkgname}-${pkgver}-aarch64.tar.gz)
sha256sums_x86_64=('b400f239b2c442a96dad9f0cbee0f61fde2a545b8a275eb72474fac4b4588932')
sha256sums_aarch64=('825a33c32d63c67a2b2cc0a2c44ded703788aa2121c376f150415a5549186ff6')

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
