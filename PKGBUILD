# This is an example of a PKGBUILD for splitting packages. Use this as a
# start to creating your own, and remove these comments. For more information,
# see 'man PKGBUILD'. NOTE: Please fill out the license field for your package!
# If it is unknown, then please put 'unknown'.

# Maintainer: Bagas Sanjaya <bagasdotme@gmail.com>
pkgname=('ttf-gitlab-mono-variable'
         'ttf-gitlab-sans-variable'
         'woff2-gitlab-mono-variable'
         'woff2-gitlab-sans-variable')
pkgbase=gitlab-fonts
pkgver=1.3.0
pkgrel=1
pkgdesc="Typefaces used in GitLab products"
arch=('any')
url="https://gitlab-org.gitlab.io/frontend/fonts/"
license=('OFL')
makedepends=('npm' 'woff2')
source=("$pkgbase-$pkgver.tar.gz::https://registry.npmjs.org/@gitlab/fonts/-/fonts-$pkgver.tgz")
noextract=("$pkgbase-$pkgver.tar.gz")
sha256sums=('d93b19ea9f7c761a4f89ac009875dfc796b5c436f4fc2ec9a43f5f4812385869')

build() {
	_staging=${srcdir}/staging
	mkdir ${_staging}
	echo "Installing fonts tarball..."
	npm install -g --prefix=${_staging} "${srcdir}/${pkgbase}-${pkgver}.tar.gz"

	echo "Unpacking WOFF2 fonts to TTF..."
	cd ${_staging}/lib/node_modules/@gitlab/fonts
	find ./gitlab-sans ./gitlab-mono -type f -name \*.woff2 -exec woff2_decompress \{\} \;
}

package_ttf-gitlab-mono-variable() {
	pkgdesc="Monospace font from GitLab"
	arch=('any')
	license=(custom:OFL)

	_staging=${srcdir}/staging
	install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-mono/*.ttf
	install -D ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-mono/OFL.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

package_ttf-gitlab-sans-variable() {
	pkgdesc="Sans-serif font from GitLab"
	arch=('any')
	license=(custom:OFL)

	_staging=${srcdir}/staging
	install -Dt "$pkgdir"/usr/share/fonts/TTF -m644 ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-sans/*.ttf
	install -D ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-sans/LICENSE.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

package_woff2-gitlab-mono-variable() {
	pkgdesc="Monospace font from GitLab"
	arch=('any')
	license=(custom:OFL)

	_staging=${srcdir}/staging
	install -Dt "$pkgdir"/usr/share/fonts/WOFF2 -m644 ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-mono/*.woff2
	install -D ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-mono/OFL.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}

package_woff2-gitlab-sans-variable() {
	pkgdesc="Sans-serif font from GitLab"
	arch=('any')
	license=(custom:OFL)

	_staging=${srcdir}/staging
	install -Dt "$pkgdir"/usr/share/fonts/WOFF2 -m644 ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-sans/*.woff2
	install -D ${_staging}/lib/node_modules/@gitlab/fonts/gitlab-sans/LICENSE.txt ${pkgdir}/usr/share/licenses/$pkgname/LICENSE
}
