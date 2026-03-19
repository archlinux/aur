# Maintainer: Your Name <your@email.com>
pkgname=koda-cli
pkgver=0.3.0
pkgrel=1
pkgdesc="CLI tool for Koda AI with CI/CD integration and version management capabilities"
arch=('x86_64')
url="https://github.com/koda-ai/koda-cli"
license=('Apache-2.0')
depends=('nodejs' 'npm')
# Native node addons (.node files) can break when stripped
options=('!strip')
optdepends=(
	'git: allow Koda to use git'
	'github-cli: interact with GitHub'
)
source=("https://registry.npmjs.org/@kodadev/koda-cli/-/koda-cli-${pkgver}.tgz")
noextract=("koda-cli-${pkgver}.tgz")
sha256sums=('c8f853edf45f09731071c7aa3b4909e3775afb853264cac152ce6932cde50103')

package() {
	npm install -g \
		--prefix "${pkgdir}/usr" \
		--cache "${srcdir}/npm-cache" \
		"${srcdir}/koda-cli-${pkgver}.tgz"

	# Fix permissions
	find "${pkgdir}/usr" -type d -exec chmod 755 {} +

	# Remove references to pkgdir in installed files
	find "${pkgdir}" -name "package.json" -exec sed -i "s|${pkgdir}||g" {} +
}
