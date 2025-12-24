# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.6 # datasource=github-tags depName=astral-sh/ty
pkgrel=2
pkgdesc='An extremely fast Python type checker and language server, written in Rust.'
arch=('aarch64' 'armv7' 'i686' 'ppc64' 'ppc64le' 's390x' 'x86_64')
url='https://github.com/astral-sh/ty'
depends=('glibc' 'gcc-libs')
license=('MIT')
provides=('ty')
conflicts=('ty')

_baseurl="${url}/releases/download/${pkgver}"

source=("LICENSE-${pkgver}::${url}/raw/refs/tags/${pkgver}/LICENSE")
source_aarch64=("ty-aarch64-${pkgver}.tgz::${_baseurl}/ty-aarch64-unknown-linux-gnu.tar.gz")
source_armv7=("ty-armv7-${pkgver}.tgz::${_baseurl}/ty-armv7-unknown-linux-gnueabihf.tar.gz")
source_i686=("ty-i686-${pkgver}.tgz::${_baseurl}/ty-i686-unknown-linux-gnu.tar.gz")
source_ppc64=("ty-ppc64-${pkgver}.tgz::${_baseurl}/ty-powerpc64-unknown-linux-gnu.tar.gz")
source_ppc64le=("ty-ppc64le-${pkgver}.tgz::${_baseurl}/ty-powerpc64le-unknown-linux-gnu.tar.gz")
source_s390x=("ty-s390x-${pkgver}.tgz::${_baseurl}/ty-s390x-unknown-linux-gnu.tar.gz")
source_x86_64=("ty-x86_64-${pkgver}.tgz::${_baseurl}/ty-x86_64-unknown-linux-gnu.tar.gz")

sha256sums=('860e3d7a86b84e6a7012c7a635fc64df475cebc6cce34dfeb73a5982ec58176c')
sha256sums_aarch64=('38df9b1eff0d93592d65073fadb82a76c1c05fbb43164144c33a57a67c3c2f81')
sha256sums_armv7=('cd17590151e2462b1e90b5cc54f6737094ce7cd51d67a452afc00fa95c063ac4')
sha256sums_i686=('4350d78a8835ebf9f13219f6b626f37db8f32757fbb260200fc5e4853f92183a')
sha256sums_ppc64=('a4f7bd4b71b37a3de172c6b58522290c0372764e45d7574fdd7da226fce53d34')
sha256sums_ppc64le=('f25763d99f029f58327eee9d25ce317063fc05abe1d0e43ac7781d8a4994d366')
sha256sums_s390x=('3ba18553cb477f0e85815b78abb717b86aecd4b65b813331fa240deb13a3bd63')
sha256sums_x86_64=('0f6f2a71a2f2ba7a69f120b4cfa6e157abdb7b0ebcd690151cdb2909cc3cee0a')

package() {

	local target="${pkgdir}/usr/bin/ty"

	install -Dm755 "$(find $srcdir -name ty)" "$target"
	install -Dm644 "LICENSE-${pkgver}" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	$target generate-shell-completion bash |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgbase.bash"

	$target generate-shell-completion elvish |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/elvish/lib/$pkgbase.elv"

	$target generate-shell-completion fish |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/fish/vendor_completions.d/$pkgbase.fish"

	$target generate-shell-completion zsh |
	install -Dm0644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgbase"
}
