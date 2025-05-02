# Maintainer: Márk Sági-Kazár <mark.sagi-kazar@gmail.com>
# Contributor: Strix <strix at immerda dot ch>

pkgname=phpenv-git
pkgver=r362.adc99a7
pkgrel=1
pkgdesc="Manage multiple PHP versions"
arch=("any")
url="https://github.com/phpenv/phpenv"
license=("MIT")
makedepends=("git")
optdepends=("php-build")
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
install=phpenv.install
source=("git+https://github.com/phpenv/phpenv")
md5sums=("SKIP")

# TODO: Update upon first tag
pkgver() {
	cd "${srcdir}/${pkgname%-git}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "${srcdir}/${pkgname%-git}"

	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname%-git}"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"

	mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/completions"
	install -m 644 ./completions/* "${pkgdir}/usr/lib/${pkgname%-git}/completions/"

	mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/libexec"
	install -m 755 ./libexec/* "${pkgdir}/usr/lib/${pkgname%-git}/libexec/"

	mkdir -p "${pkgdir}/usr/bin"
	ln -s "/usr/lib/${pkgname%-git}/libexec/${pkgname%-git}" "${pkgdir}/usr/bin/${pkgname%-git}"
}
