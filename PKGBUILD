# Maintainer: Will Handley <wh260@cam.ac.uk>
pkgname=ampcode
_npmname="@sourcegraph/amp"
pkgver=0.0.1751990659.g94e814
pkgrel=1
pkgdesc="CLI for Amp, an agentic coding tool in research preview from Sourcegraph"
arch=('any')
url="https://github.com/sourcegraph/amp"
license=('Apache-2.0')
depends=('nodejs>=18')
makedepends=('npm')
provides=('amp')
optdepends=(
	'git: allow Amp to use git'
	'github-cli: interact with GitHub'
	'glab: interact with GitLab'
	'ripgrep: enhanced file search'
)
_npmver=${pkgver//.g/-g}
source=("https://registry.npmjs.org/$_npmname/-/amp-$_npmver.tgz")
b2sums=('ecfc63b2e30250b9268551c4cee42ec452a88bdb11b6b696ef16bc40ca5c8fb7f6988589063eafb9fcee720fb0fce823883db19be907152874ee060180e77570')
noextract=("amp-$_npmver.tgz")

package() {
	npm install -g --prefix "${pkgdir}/usr" "${srcdir}/amp-$_npmver.tgz"

	# Install README as license documentation since no LICENSE file exists
	install -Dm644 "${pkgdir}/usr/lib/node_modules/$_npmname/README.md" "${pkgdir}/usr/share/licenses/${pkgname}/README.md"
}
