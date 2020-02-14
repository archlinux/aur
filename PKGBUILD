# Maintainer: Tom Whitwell <tom.whitwell@digital.cabinet-office.gov.uk>
pkgname=govuk-guix-git
pkgver=r22071.8d3fbcde3
pkgrel=1
pkgdesc="CLI for GDS Staff"
arch=('any')
url="https://github.com/alphagov/govuk-guix"
license=('MIT')
makedepends=('git' 'ruby')
provides=("govuk-guix=${pkgver}")
conflicts=('govuk-guix')
source=("${pkgname}"::"git+https://github.com/alphagov/govuk-guix")
sha512sums=('SKIP')

pkgver() {
	pushd "${srcdir}/${pkgname}" >/dev/null
	{
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	}
	popd >/dev/null
}

package() {
	msg2 'gds binary'
	pushd "${srcdir}/${pkgname}/bin" >/dev/null
	{
		install -d "${pkgdir}/usr/bin"
		install -Dm755 govuk* "${pkgdir}/usr/bin"
	}
	popd >/dev/null

	msg2 'license'
	pushd "${srcdir}/${pkgname}" >/dev/null
	{
		install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	}
	popd >/dev/null
}
