# Contributor: Nguyễn Quang Minh <minhnbnt at gmail dot com>

pkgname=ty-bin
pkgver=0.0.7 # datasource=github-tags depName=astral-sh/ty
pkgrel=1
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
sha256sums_aarch64=('657568353b42810504037675bfab1270bd025561fbcc4d163e014f9cb2f4ed94')
sha256sums_armv7=('094f50eb88c97b49a077cef706d5af12fc95322ac5b726c9db02c7da368f5809')
sha256sums_i686=('4ee2b25e9582f75de64596930f7f33fca5df586353e6e972c6c6974e5d6cd528')
sha256sums_ppc64=('3b9d334deb38dd0e5aeb083f7cfacec5ba63a4b223427a35b4e9a03385576926')
sha256sums_ppc64le=('0f558ca2b14ae692e395a1b754ea33fa367c68549512c07413212ac8b751f319')
sha256sums_s390x=('fbdb4b7fdf94d6572385705ac6b14d5db03b7006950451a819ee68ae71f0d103')
sha256sums_x86_64=('a6f01a829d10545a437d3c9ca5596eced1b4911b66b98c926767a34e45d46c6c')

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
